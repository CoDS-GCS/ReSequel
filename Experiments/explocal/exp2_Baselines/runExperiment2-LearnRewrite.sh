#!/bin/bash

dataset=$1
dbms=$2
baseline_name='LearnRewrite'

exp_path="$(pwd)"

output_path="${exp_path}/LearnRewrite-results/${dataset}-${baseline_name}"
mkdir -p "${exp_path}/LearnRewrite-results"

rm -rf ${output_path}
mkdir -p ${output_path}

workload_path="${exp_path}/workload/${dbms}/${dataset}"
schema_path="${exp_path}/catalog/${dataset}/schema.json"
log_file_name="${exp_path}/results/runExperiment2-${dataset}-${dbms}-${baseline_name}.dat"

if [ $dataset == "publicbibenchmark" ]; then
    mkdir -p "${output_path}/queries"
fi 

cd "${exp_path}/setup/Baselines/LearnRewrite"
source venv/bin/activate

CMD="python LearnedRewriter_pg.py --workload-path ${workload_path} \
                    --schema-path ${schema_path} \
                    --database-name ${dataset} \
                    --dbms ${dbms} \
                    --output-path ${output_path}"


start=$(date +%s%N)
$CMD
end=$(date +%s%N)

echo ${dataset}",${dbms},"$((($end - $start) / 1000000)) >>$log_file_name
