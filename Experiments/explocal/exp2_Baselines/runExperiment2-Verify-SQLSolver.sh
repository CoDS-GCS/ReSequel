#!/bin/bash

dataset=$1
dbms=$2
llm_model=$3

exp_path="$(pwd)"

orig_workload_path="${exp_path}/workload/${dbms}/${dataset}"
rewrite_workload_path="${exp_path}/workload/${dbms}/${dataset}-${llm_model}-select"
schema_path="${orig_workload_path}/schema.sql"

if [ $dataset == "publicbibenchmark" ]; then
    orig_workload_path="${orig_workload_path}/queries"
    rewrite_workload_path="${rewrite_workload_path}/queries"
fi

echo $rewrite_workload_path

verify_log_path="${exp_path}/results/Experiment1_SQLSolver_${dataset}_${llm_model}.dat"
verify_overall_log_path="${exp_path}/results/Experiment1_SQLSolver_${dataset}_${llm_model}_overall.dat"
log_file_name="${exp_path}/results/Experiment1_SQLSolver.dat"

cd "${exp_path}/setup/Baselines/SQLSolver"
export LD_LIBRARY_PATH=${exp_path}/setup/Baselines/SQLSolver/extraLibs

start=$(date +%s%N)
java -Xmx128g -Xms128g -Xmn12g --add-modules jdk.incubator.vector \
     -Dsqlsolver.config=sqlsolver.properties \
     -DorigWorkloadPah=${orig_workload_path} \
     -DrewriteWorkloadPah=${rewrite_workload_path} \
     -DschemaPath=${schema_path} \
     -DlogFileName=${verify_log_path} \
     -DoverallLogFileName=${verify_overall_log_path} \
     -cp "target/SQLSolver-1.0-SNAPSHOT.jar:target/libs/*" \
     org.resequel.Main


end=$(date +%s%N)

echo ${dataset}",${dbms},${llm_model},"$((($end - $start) / 1000000)) >>$log_file_name