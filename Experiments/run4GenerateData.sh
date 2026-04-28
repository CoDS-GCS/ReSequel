#!/bin/bash

root_path="$(pwd)"
data_path="${root_path}/data"

mkdir -p ${data_path}
gdb_path="${root_path}/setup/Baselines/GDB"
gendb_path="${root_path}/setup/Baselines/GenerateData"

rm -rf "${data_path}/dsb" # clean-up
rm -rf "${data_path}/tpch" # clean-up

### TPC-H Scale=10
###*******************
cd ${gdb_path}
cd TPC-H
./runAll.sh 10 "${data_path}/tpch" "/tmp/"

### DSB Scale=100
###*******************
cd ${gdb_path}
cd DSB
./runAll.sh 100 "${data_path}/dsb" "/tmp/"
