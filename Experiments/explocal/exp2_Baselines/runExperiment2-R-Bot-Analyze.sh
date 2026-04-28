#!/bin/bash

dataset=$1
dbms=$2
baseline_name='R-Bot'
llm_model=$4

exp_path="$(pwd)"


date=$(date '+%Y-%m-%d-%H-%M-%S')
system_log="${exp_path}/system-log-${date}.dat"

output_path="${exp_path}/R-Bot-results/Rewrite/${dbms}/${dataset}/${llm_model}"
log_dir="${exp_path}/R-Bot-results/Rewrite/${dbms}/${dataset}/${llm_model}-LOG"

workload_output="${exp_path}/R-Bot-results/workload/${dbms}/${dataset}/${llm_model}"
mkdir -p "${exp_path}/R-Bot-results/workload"
mkdir -p "${exp_path}/R-Bot-results/workload/${dbms}"
mkdir -p "${exp_path}/R-Bot-results/workload/${dbms}/${dataset}"
mkdir -p "${workload_output}"

cache_path="${exp_path}/R-Bot-results/cache/${dbms}/${dataset}/${llm_model}"
mkdir -p "${exp_path}/R-Bot-results/cache"
mkdir -p "${exp_path}/R-Bot-results/cache/${dbms}"
mkdir -p "${exp_path}/R-Bot-results/cache/${dbms}/${dataset}"
mkdir -p "${cache_path}"

result_log_path="${exp_path}/results/Experiment1-R-Bot-Rewrite-${dataset}-${dbms}-${llm_model}.dat"

workload_path="${exp_path}/workload/${dbms}/${dataset}"
log_file_name="${exp_path}/results/runExperiment2-${dataset}-${dbms}-${baseline_name}-Analyze.dat"

if [ $dataset == "publicbibenchmark" ]; then
    mkdir -p "${output_path}/queries"
fi 

cd "${exp_path}/setup/Baselines/R-Bot/"
source venv/bin/activate
cd my_rewriter

CMD="python main_analyze.py --database ${dataset} \
                    --llm-model ${llm_model} \
                    --workload-path ${workload_path} \
                    --output-path ${output_path} \
                    --workload-output ${workload_output} \
                    --cache-path ${cache_path} \
                    --dbms ${dbms} \
                    --log-dir ${log_dir} \
                    --result-log-path ${result_log_path} \
                    --system-log ${system_log}"


start=$(date +%s%N)
$CMD
end=$(date +%s%N)

echo ${dataset}",${dbms},"$((($end - $start) / 1000000)) >>$log_file_name

