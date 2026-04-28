#ifndef THREADPOOL_H
#define THREADPOOL_H

#pragma once
#include <thread>
#include <queue>
#include <condition_variable>
#include <functional>
#include <vector>
#include <mutex>
#include <atomic>
#include <future>
#include <utility>
#include "PostgresConnection.h"

namespace minidb {

    class ThreadPool {
    public:
        explicit ThreadPool(const std::string& conn_str) {
            size_t num_threads = std::thread::hardware_concurrency();
            workers_.reserve(num_threads);
            worker_objects_.reserve(num_threads);

            for (size_t i = 0; i < num_threads; ++i) {
                auto worker = std::make_unique<Worker>(this, conn_str);
                worker_objects_.push_back(std::move(worker));
                workers_.emplace_back(&Worker::operator(), worker_objects_.back().get());
            }
        }
        ~ThreadPool() {
            stop_.store(true, std::memory_order_relaxed);
            cv_task_.notify_all();

            for (auto& t : workers_) {
                if (t.joinable()) {
                    t.join();
                }
            }
        }

        ThreadPool(const ThreadPool&) = delete;
        ThreadPool& operator=(const ThreadPool&) = delete;
        ThreadPool(ThreadPool&&) noexcept = default;
        ThreadPool& operator=(ThreadPool&&) noexcept = default;

        template<typename F, typename... Args>
        auto enqueue(F&& f, Args&&... args) -> std::future<std::invoke_result_t<F, Args...>> {
            using return_type = std::invoke_result_t<F, Args...>;

            auto task = std::make_shared<std::packaged_task<return_type()>>(
                std::bind(std::forward<F>(f), std::forward<Args>(args)...)
            );

            std::future<return_type> result = task->get_future();

            {
                std::lock_guard<std::mutex> lock(mtx_);
                if (stop_.load(std::memory_order_relaxed))
                    throw std::runtime_error("enqueue on stopped ThreadPool");

                tasks_.emplace([task]() { (*task)(); });
                ++active_tasks_;
            }
            cv_task_.notify_one();

            return result;
        }

        void join() {
            std::unique_lock<std::mutex> lock(mtx_);
            cv_done_.wait(lock, [this] { return tasks_.empty() && active_tasks_ == 0; });
        }

        [[nodiscard]] size_t size() const noexcept { return workers_.size(); }

        void shutdown() {
            join();
            stop_.store(true, std::memory_order_relaxed);
            cv_task_.notify_all();
            for (auto& t : workers_) if (t.joinable()) t.join();
            worker_objects_.clear();
        }

        static PostgresConnection& get_current_connection() {
            if (!tls_connection) {
                throw std::runtime_error("No PostgresConnection in this thread. Are you in a ThreadPool task?");
            }
            return *tls_connection;
        }

    private:
        const std::string connection_string_;
        std::queue<std::function<void()>> tasks_;

        mutable std::mutex mtx_;
        std::condition_variable cv_task_;
        std::condition_variable cv_done_;

        std::atomic<bool> stop_{false};
        std::atomic<size_t> active_tasks_{0};

        struct Worker {
            ThreadPool* pool;
            PostgresConnection connection;
            explicit Worker(ThreadPool* p, const std::string& conn_str): pool(p), connection(conn_str) {}
            void operator()() {
                tls_connection = &connection;

                while (true) {
                    std::function<void()> task;

                    {
                        std::unique_lock<std::mutex> lock(pool->mtx_);
                        pool->cv_task_.wait(lock, [this] {
                            return pool->stop_.load(std::memory_order_relaxed) || !pool->tasks_.empty();
                        });

                        if (pool->stop_.load(std::memory_order_relaxed) && pool->tasks_.empty())
                            break;

                        if (pool->tasks_.empty())
                            continue;

                        task = std::move(pool->tasks_.front());
                        pool->tasks_.pop();
                    }

                    task();  // Execute task with correct connection

                    // FIXED: Notify only when last task finishes
                    if (--pool->active_tasks_ == 0) {
                        std::lock_guard<std::mutex> lock(pool->mtx_);
                        if (pool->tasks_.empty()) {
                            pool->cv_done_.notify_all();
                        }
                    }
                }
            }
        };

        static thread_local PostgresConnection* tls_connection;
        std::vector<std::thread> workers_;
        std::vector<std::unique_ptr<Worker>> worker_objects_;
    };

    inline thread_local PostgresConnection* ThreadPool::tls_connection = nullptr;
} // namespace minidb

#endif // THREADPOOL_H