#include "FileHandler.h"
#include <fstream>
#include <sstream>
#include <stdexcept>

std::string FileHandler::ReadEntireTextFile(const std::string& filePath) {
    std::ifstream file(filePath);

    if (!file.is_open()) {
        throw std::runtime_error("Failed to open file: " + filePath);
    }

    std::ostringstream ss;
    ss << file.rdbuf();
    return ss.str();
}

void FileHandler::SaveTextFile(const std::string& filePath, const std::string& data) {
    std::ofstream file(filePath);

    if (!file.is_open()) {
        throw std::runtime_error("Failed to open file for writing: " + filePath);
    }

    file << data;

    if (!file.good()) {
        throw std::runtime_error("Failed to write data to file: " + filePath);
    }
}

#include "FileHandler.h"
