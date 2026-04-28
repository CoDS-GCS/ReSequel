#!/bin/bash

dataset=$1
dbms=$2
llm_model=$3

exp_path="$(pwd)"

workload_path="${exp_path}/workload/${dbms}/${dataset}"
rewrite_path="${exp_path}/archive/SIGMOD2026/LLM-R2/${dbms}/${llm_model}/${dataset}-LLM-R2"
output_path_verify="${exp_path}/archive/SIGMOD2026/LLM-R2/${dbms}/${llm_model}/${dataset}-LLM-R2-select"

rm -rf ${output_path_verify}
mkdir -p ${output_path_verify}

if [ $dataset == "publicbibenchmark" ]; then
    mkdir -p "${output_path_verify}/queries"
fi    

verify_log_path="${exp_path}/results/Experiment1_Verify.dat"

cd "${exp_path}/setup/Baselines/Workload"
source venv/bin/activate

CMD="python main_verify_LR.py --workload-path ${workload_path} \
                    --database-name ${dataset} \
                    --dbms ${dbms} \
                    --rewrite-path ${rewrite_path} \
                    --verify-log-path ${verify_log_path} \
                    --output-path-verify ${output_path_verify}"

$CMD