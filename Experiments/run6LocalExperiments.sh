#!/bin/bash

# clean original results
rm -rf results/*;
mkdir -p results;

export iteration=10

CMDReSequel=./explocal/exp1_ReSequel/runExperiment1.sh
CMDBaseline=./explocal/exp2_Baselines/runExperiment2.sh
CMDBaselineLearnrewrite=./explocal/exp2_Baselines/runExperiment2-LearnRewrite.sh
CMDRunReSequel=./explocal/exp2_Baselines/runExperiment2-ReSequel.sh
CMDRunReSequelOR=./explocal/exp2_Baselines/runExperiment2-ReSequel-OR.sh
CMDRunReSequelMicroOR=./explocal/exp2_Baselines/runExperiment2-ReSequel-Micro-OR.sh

CMDDBMSConfig=./explocal/exp3_config/runExperiment3_PGConfig.sh
CMDBaselineConfig=./explocal/exp3_config/runExperiment3.sh
CMDRunReSequelConfig=./explocal/exp3_config/runExperiment3-ReSequel.sh

## Templatization
#****************
$CMDReSequel Templatization imdb PostgreSQL 1
$CMDReSequel Templatization imdb_13k PostgreSQL 1
$CMDReSequel Templatization dsb PostgreSQL 1
$CMDReSequel Templatization stackoverflow PostgreSQL 1
$CMDReSequel Templatization tpch PostgreSQL 1
$CMDReSequel Templatization stats PostgreSQL 1
$CMDReSequel Templatization stats_ceb PostgreSQL 1
$CMDReSequel Templatization publicbibenchmark PostgreSQL 1

$CMDReSequel Templatization imdb MySQL 1
$CMDReSequel Templatization stackoverflow MySQL 1
$CMDReSequel Templatization stats MySQL 1
$CMDReSequel Templatization stats_ceb MySQL 1

$CMDReSequel Templatization imdb DuckDB 1
$CMDReSequel Templatization imdb_13k DuckDB 1
$CMDReSequel Templatization dsb DuckDB 1
$CMDReSequel Templatization stackoverflow DuckDB 1
$CMDReSequel Templatization tpch DuckDB 1
$CMDReSequel Templatization stats DuckDB 1
$CMDReSequel Templatization stats_ceb DuckDB 1
$CMDReSequel Templatization publicbibenchmark DuckDB 1

###  Rewrite
### **********
$CMDReSequel Generate imdb PostgreSQL 1 gemini-2.5-pro
$CMDReSequel Generate imdb_13k PostgreSQL 1 gemini-2.5-pro
$CMDReSequel Generate tpch PostgreSQL 1 gemini-2.5-pro
$CMDReSequel Generate stats PostgreSQL 1 gemini-2.5-pro
$CMDReSequel Generate stats_ceb PostgreSQL 1 gemini-2.5-pro
$CMDReSequel Generate stackoverflow PostgreSQL 1 gemini-2.5-pro
$CMDReSequel Generate publicbibenchmark PostgreSQL 1 gemini-2.5-pro
$CMDReSequel Generate dsb PostgreSQL 1 gemini-2.5-pro

$CMDReSequel Generate imdb PostgreSQL 1 gpt-oss-120b
$CMDReSequel Generate imdb_13k PostgreSQL 1 gpt-oss-120b
$CMDReSequel Generate tpch PostgreSQL 1 gpt-oss-120b
$CMDReSequel Generate stats PostgreSQL 1 gpt-oss-120b
$CMDReSequel Generate stats_ceb PostgreSQL 1 gpt-oss-120b
$CMDReSequel Generate stackoverflow PostgreSQL 1 gpt-oss-120b
$CMDReSequel Generate publicbibenchmark PostgreSQL 1 gpt-oss-120b
$CMDReSequel Generate dsb PostgreSQL 1 gpt-oss-120b

$CMDReSequel Generate stats MySQL 1 gemini-2.5-pro
$CMDReSequel Generate stats_ceb MySQL 1 gemini-2.5-pro
$CMDReSequel Generate stackoverflow MySQL 1 gemini-2.5-pro

$CMDReSequel Generate imdb DuckDB 1 gemini-2.5-pro
$CMDReSequel Generate imdb_13k DuckDB 1 gemini-2.5-pro
$CMDReSequel Generate tpch DuckDB 1 gemini-2.5-pro
$CMDReSequel Generate stats DuckDB 1 gemini-2.5-pro
$CMDReSequel Generate stats_ceb DuckDB 1 gemini-2.5-pro
$CMDReSequel Generate stackoverflow DuckDB 1 gemini-2.5-pro
$CMDReSequel Generate publicbibenchmark DuckDB 1 gemini-2.5-pro
$CMDReSequel Generate dsb DuckDB 1 gemini-2.5-pro


###  Reconstruct
### ***********
$CMDReSequel Reconstruct imdb PostgreSQL 1 gemini-2.5-pro
$CMDReSequel Reconstruct imdb_13k PostgreSQL 1 gemini-2.5-pro
$CMDReSequel Reconstruct dsb PostgreSQL 1 gemini-2.5-pro
$CMDReSequel Reconstruct stackoverflow PostgreSQL 1 gemini-2.5-pro
$CMDReSequel Reconstruct tpch PostgreSQL 1 gemini-2.5-pro
$CMDReSequel Reconstruct stats PostgreSQL 1 gemini-2.5-pro
$CMDReSequel Reconstruct stats_ceb PostgreSQL 1 gemini-2.5-pro
$CMDReSequel Reconstruct publicbibenchmark PostgreSQL 1 gemini-2.5-pro

$CMDReSequel Reconstruct imdb PostgreSQL 1 gpt-oss-120b
$CMDReSequel Reconstruct imdb_13k PostgreSQL 1 gpt-oss-120b
$CMDReSequel Reconstruct dsb PostgreSQL 1 gpt-oss-120b
$CMDReSequel Reconstruct stackoverflow PostgreSQL 1 gpt-oss-120b
$CMDReSequel Reconstruct tpch PostgreSQL 1 gpt-oss-120b
$CMDReSequel Reconstruct stats PostgreSQL 1 gpt-oss-120b
$CMDReSequel Reconstruct stats_ceb PostgreSQL 1 gpt-oss-120b
$CMDReSequel Reconstruct publicbibenchmark PostgreSQL 1 gpt-oss-120b

$CMDReSequel Reconstruct imdb MySQL 1 gemini-2.5-pro
$CMDReSequel Reconstruct stackoverflow MySQL 1 gemini-2.5-pro
$CMDReSequel Reconstruct stats MySQL 1 gemini-2.5-pro
$CMDReSequel Reconstruct stats_ceb MySQL 1 gemini-2.5-pro

$CMDReSequel Reconstruct imdb DuckDB 1 gemini-2.5-pro
$CMDReSequel Reconstruct imdb_13k DuckDB 1 gemini-2.5-pro
$CMDReSequel Reconstruct dsb DuckDB 1 gemini-2.5-pro
$CMDReSequel Reconstruct stackoverflow DuckDB 1 gemini-2.5-pro
$CMDReSequel Reconstruct tpch DuckDB 1 gemini-2.5-pro
$CMDReSequel Reconstruct stats DuckDB 1 gemini-2.5-pro
$CMDReSequel Reconstruct stats_ceb DuckDB 1 gemini-2.5-pro
$CMDReSequel Reconstruct publicbibenchmark DuckDB 1 gemini-2.5-pro


###  Verify
### *******
$CMDReSequel Verify imdb PostgreSQL 1 gemini-2.5-pro PostgreSQL
$CMDReSequel Verify imdb_13k PostgreSQL 1 gemini-2.5-pro PostgreSQL
$CMDReSequel Verify tpch PostgreSQL 1 gemini-2.5-pro PostgreSQL
$CMDReSequel Verify stats PostgreSQL 1 gemini-2.5-pro PostgreSQL
$CMDReSequel Verify stats_ceb PostgreSQL 1 gemini-2.5-pro PostgreSQL
$CMDReSequel Verify stackoverflow PostgreSQL 1 gemini-2.5-pro PostgreSQL
$CMDReSequel Verify publicbibenchmark PostgreSQL 1 gemini-2.5-pro PostgreSQL
$CMDReSequel Verify dsb PostgreSQL 1 gemini-2.5-pro PostgreSQL

$CMDReSequel Verify imdb PostgreSQL 1 gpt-oss-120b PostgreSQL
$CMDReSequel Verify imdb_13k PostgreSQL 1 gpt-oss-120b PostgreSQL
$CMDReSequel Verify tpch PostgreSQL 1 gpt-oss-120b PostgreSQL
$CMDReSequel Verify stats PostgreSQL 1 gpt-oss-120b PostgreSQL
$CMDReSequel Verify stats_ceb PostgreSQL 1 gpt-oss-120b PostgreSQL
$CMDReSequel Verify stackoverflow PostgreSQL 1 gpt-oss-120b PostgreSQL
$CMDReSequel Verify publicbibenchmark PostgreSQL 1 gpt-oss-120b PostgreSQL
$CMDReSequel Verify dsb PostgreSQL 1 gpt-oss-120b PostgreSQL


$CMDReSequel Verify stats MySQL 1 gemini-2.5-pro MySQL
$CMDReSequel Verify stats_ceb MySQL 1 gemini-2.5-pro MySQL
$CMDReSequel Verify stackoverflow MySQL 1 gemini-2.5-pro MySQL

$CMDReSequel Verify imdb DuckDB 1 gemini-2.5-pro DuckDB
$CMDReSequel Verify imdb_13k DuckDB 1 gemini-2.5-pro DuckDB
$CMDReSequel Verify tpch DuckDB 1 gemini-2.5-pro DuckDB
$CMDReSequel Verify stats DuckDB 1 gemini-2.5-pro DuckDB
$CMDReSequel Verify stats_ceb DuckDB 1 gemini-2.5-pro DuckDB
$CMDReSequel Verify stackoverflow DuckDB 1 gemini-2.5-pro DuckDB
$CMDReSequel Verify publicbibenchmark DuckDB 1 gemini-2.5-pro DuckDB
$CMDReSequel Verify dsb DuckDB 1 gemini-2.5-pro DuckDB


## Run Rewrite Queries
#********************
$CMDRunReSequel stats PostgreSQL gemini-2.5-pro
$CMDRunReSequel stats_ceb PostgreSQL gemini-2.5-pro
$CMDRunReSequel tpch PostgreSQL gemini-2.5-pro
$CMDRunReSequel stackoverflow PostgreSQL gemini-2.5-pro
$CMDRunReSequel imdb PostgreSQL gemini-2.5-pro
$CMDRunReSequel imdb_13k PostgreSQL gemini-2.5-pro
$CMDRunReSequel publicbibenchmark PostgreSQL gemini-2.5-pro
$CMDRunReSequel dsb PostgreSQL gemini-2.5-pro

$CMDRunReSequel stats PostgreSQL gpt-oss-120b
$CMDRunReSequel stats_ceb PostgreSQL gpt-oss-120b
$CMDRunReSequel tpch PostgreSQL gpt-oss-120b
$CMDRunReSequel stackoverflow PostgreSQL gpt-oss-120b
$CMDRunReSequel imdb PostgreSQL gpt-oss-120b
$CMDRunReSequel imdb_13k PostgreSQL gpt-oss-120b
$CMDRunReSequel publicbibenchmark PostgreSQL gpt-oss-120b
$CMDRunReSequel dsb PostgreSQL gpt-oss-120b

$CMDRunReSequel stats MySQL gemini-2.5-pro
$CMDRunReSequel stats_ceb MySQL gemini-2.5-pro
$CMDRunReSequel stackoverflow MySQL gemini-2.5-pro

$CMDRunReSequel imdb_13k DuckDB gemini-2.5-pro
$CMDRunReSequel stats DuckDB gemini-2.5-pro
$CMDRunReSequel stats_ceb DuckDB gemini-2.5-pro
$CMDRunReSequel stackoverflow DuckDB gemini-2.5-pro
$CMDRunReSequel publicbibenchmark DuckDB gemini-2.5-pro

## Run Baselines
#***************
$CMDBaseline stats PostgreSQL 1
$CMDBaseline stats_ceb PostgreSQL 1
$CMDBaseline tpch PostgreSQL 1
$CMDBaseline stackoverflow PostgreSQL 1
$CMDBaseline imdb PostgreSQL 1
$CMDBaseline imdb_13k PostgreSQL 1
$CMDBaseline publicbibenchmark PostgreSQL 1 
$CMDBaseline dsb PostgreSQL 1 

$CMDBaseline stats MySQL 1
$CMDBaseline stats_ceb MySQL 1
$CMDBaseline stackoverflow MySQL 1

$CMDBaseline imdb DuckDB 1
$CMDBaseline imdb_13k DuckDB 1
$CMDBaseline stats DuckDB 1
$CMDBaseline stats_ceb DuckDB 1
$CMDBaseline stackoverflow DuckDB 1
$CMDBaseline publicbibenchmark DuckDB 1
$CMDBaseline dsb DuckDB 1