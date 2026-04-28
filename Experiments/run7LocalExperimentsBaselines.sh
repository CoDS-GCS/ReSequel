#!/bin/bash

# clean original results
rm -rf results/*;
mkdir -p results;

export iteration=10

CMDBaselineLearnRewrite=./explocal/exp2_Baselines/runExperiment2-LearnRewrite.sh
CMDRunLR=./explocal/exp2_Baselines/runExperiment2-ReSequel.sh
CMDBaselineLLMR2=./explocal/exp2_Baselines/runExperiment2-LLM-R2.sh
CMDBaselineRBot=./explocal/exp2_Baselines/runExperiment2-R-Bot.sh
CMDBaselineRBotAnalyze=./explocal/exp2_Baselines/runExperiment2-R-Bot-Analyze.sh
CMDRunLRVerify=./explocal/exp2_Baselines/runExperiment2-Verify-LearnRewrite.sh
CMDRunLLMR2Verify=./explocal/exp2_Baselines/runExperiment2-Verify-LLM-R2.sh
CMDRunRBotVerify=./explocal/exp2_Baselines/runExperiment2-Verify-R-Bot.sh
CMDRunSQLSolverVerify=./explocal/exp2_Baselines/runExperiment2-Verify-SQLSolver.sh

## Rewrite Queries by LearnedRewrite
##################################################
$CMDBaselineLearnRewrite tpch PostgreSQL
$CMDBaselineLearnRewrite imdb PostgreSQL
$CMDBaselineLearnRewrite imdb_13k PostgreSQL
$CMDBaselineLearnRewrite stats PostgreSQL
$CMDBaselineLearnRewrite stats_ceb PostgreSQL
$CMDBaselineLearnRewrite publicbibenchmark PostgreSQL
$CMDBaselineLearnRewrite stackoverflow PostgreSQL
$CMDBaselineLearnRewrite dsb PostgreSQL


### Rewrite Queries LLM-R2
### ********************
$CMDBaselineLLMR2 tpch PostgreSQL LLM-R2 gemini-2.5-pro
$CMDBaselineLLMR2 imdb PostgreSQL LLM-R2 gemini-2.5-pro
$CMDBaselineLLMR2 dsb PostgreSQL LLM-R2 gemini-2.5-pro

$CMDBaselineLLMR2 tpch PostgreSQL LLM-R2 gpt-oss-120b
$CMDBaselineLLMR2 imdb PostgreSQL LLM-R2 gpt-oss-120b
$CMDBaselineLLMR2 dsb PostgreSQL LLM-R2 gpt-oss-120b


### Rewrite Queries R-Bot
### ********************
$CMDBaselineRBot tpch PostgreSQL R-Bot gemini-2.5-pro
$CMDBaselineRBot imdb PostgreSQL R-Bot gemini-2.5-pro
$CMDBaselineRBot dsb PostgreSQL R-Bot gemini-2.5-pro
$CMDBaselineRBot stats PostgreSQL R-Bot gemini-2.5-pro
$CMDBaselineRBot stats_ceb PostgreSQL R-Bot gemini-2.5-pro
$CMDBaselineRBot publicbibenchmark PostgreSQL R-Bot gemini-2.5-pro

$CMDBaselineRBot tpch PostgreSQL R-Bot gpt-oss-120b
$CMDBaselineRBot imdb PostgreSQL R-Bot gpt-oss-120b
$CMDBaselineRBot dsb PostgreSQL R-Bot gpt-oss-120b

###  Verify LearnedRewrite Queries
### ******************************
$CMDRunLRVerify imdb PostgreSQL
$CMDRunLRVerify imdb_13k PostgreSQL
$CMDRunLRVerify tpch PostgreSQL
$CMDRunLRVerify stats PostgreSQL
$CMDRunLRVerify stats_ceb PostgreSQL
$CMDRunLRVerify publicbibenchmark PostgreSQL
$CMDRunLRVerify stackoverflow PostgreSQL
$CMDRunLRVerify dsb PostgreSQL

$CMDRunLRVerify imdb MySQL
$CMDRunLRVerify imdb_13k MySQL
$CMDRunLRVerify tpch MySQL
$CMDRunLRVerify stats MySQL
$CMDRunLRVerify stats_ceb MySQL
$CMDRunLRVerify publicbibenchmark MySQL
$CMDRunLRVerify stackoverflow MySQL
$CMDRunLRVerify dsb MySQL

$CMDRunLRVerify imdb DuckDB
$CMDRunLRVerify imdb_13k DuckDB
$CMDRunLRVerify tpch DuckDB
$CMDRunLRVerify stats DuckDB
$CMDRunLRVerify stats_ceb DuckDB
$CMDRunLRVerify publicbibenchmark DuckDB
$CMDRunLRVerify stackoverflow DuckDB
$CMDRunLRVerify dsb DuckDB

###  Verify LLM-R2 Queries
### **********************
$CMDRunLLMR2Verify imdb PostgreSQL gemini-2.5-pro
$CMDRunLLMR2Verify tpch PostgreSQL gemini-2.5-pro
$CMDRunLLMR2Verify dsb PostgreSQL gemini-2.5-pro

$CMDRunLLMR2Verify imdb PostgreSQL gpt-oss-120b
$CMDRunLLMR2Verify tpch PostgreSQL gpt-oss-120b
$CMDRunLLMR2Verify dsb PostgreSQL gpt-oss-120b

###  Verify R-Bot Queries
### **********************
$CMDRunRBotVerify imdb PostgreSQL gemini-2.5-pro
$CMDRunRBotVerify tpch PostgreSQL gemini-2.5-pro
$CMDRunRBotVerify dsb PostgreSQL gemini-2.5-pro
$CMDRunRBotVerify stats PostgreSQL gemini-2.5-pro
$CMDRunRBotVerify stats_ceb PostgreSQL gemini-2.5-pro
$CMDRunRBotVerify publicbibenchmark PostgreSQL gemini-2.5-pro

$CMDRunRBotVerify imdb PostgreSQL gpt-oss-120b
$CMDRunRBotVerify tpch PostgreSQL gpt-oss-120b
$CMDRunRBotVerify dsb PostgreSQL gpt-oss-120b


### Run Queries LearnedRewrite
### **************
$CMDRunLR stackoverflow PostgreSQL LearnRewrite
$CMDRunLR imdb PostgreSQL LearnRewrite
$CMDRunLR imdb_13k PostgreSQL LearnRewrite
$CMDRunLR publicbibenchmark PostgreSQL LearnRewrite
$CMDRunLR dsb PostgreSQL LearnRewrite
$CMDRunLR tpch PostgreSQL LearnRewrite
$CMDRunLR stats_ceb PostgreSQL LearnRewrite
$CMDRunLR stats PostgreSQL LearnRewrite

$CMDRunLR stackoverflow MySQL LearnRewrite
$CMDRunLR imdb MySQL LearnRewrite
$CMDRunLR imdb_13k MySQL LearnRewrite
$CMDRunLR publicbibenchmark MySQL LearnRewrite
$CMDRunLR dsb MySQL LearnRewrite
$CMDRunLR tpch MySQL LearnRewrite
$CMDRunLR stats_ceb MySQL LearnRewrite
$CMDRunLR stats MySQL LearnRewrite


$CMDRunLR stackoverflow DuckDB LearnRewrite
$CMDRunLR imdb DuckDB LearnRewrite
$CMDRunLR imdb_13k DuckDB LearnRewrite
$CMDRunLR publicbibenchmark DuckDB LearnRewrite
$CMDRunLR dsb DuckDB LearnRewrite
$CMDRunLR tpch DuckDB LearnRewrite
$CMDRunLR stats_ceb DuckDB LearnRewrite
$CMDRunLR stats DuckDB LearnRewrite

### Run Queries LLM-R2
### *******************
$CMDRunLR tpch PostgreSQL LLM-R2-Gemini
$CMDRunLR imdb PostgreSQL LLM-R2-Gemini
$CMDRunLR dsb PostgreSQL LLM-R2-Gemini

$CMDRunLR tpch PostgreSQL LLM-R2-OSS-120B
$CMDRunLR imdb PostgreSQL LLM-R2-OSS-120B
$CMDRunLR dsb PostgreSQL LLM-R2-OSS-120B


### Run Queries R-Bot
### *******************
$CMDRunLR stats DuckDB R-Bot-Gemini
$CMDRunLR stats_ceb DuckDB R-Bot-Gemini

$CMDRunLR stats PostgreSQL R-Bot-Gemini
$CMDRunLR stats_ceb PostgreSQL R-Bot-Gemini

$CMDRunLR stats MySQL R-Bot-Gemini
$CMDRunLR stats_ceb MySQL R-Bot-Gemini

$CMDRunLR tpch PostgreSQL R-Bot-Gemini
$CMDRunLR imdb PostgreSQL R-Bot-Gemini
$CMDRunLR dsb PostgreSQL R-Bot-Gemini


$CMDRunLR tpch PostgreSQL R-Bot-OSS-120B
$CMDRunLR imdb PostgreSQL R-Bot-OSS-120B
$CMDRunLR dsb PostgreSQL R-Bot-OSS-120B

### Run SQLSolver Baseline
## ***************************************
$CMDRunSQLSolverVerify stats PostgreSQL gemini-2.5-pro
$CMDRunSQLSolverVerify stats_ceb PostgreSQL gemini-2.5-pro
$CMDRunSQLSolverVerify imdb PostgreSQL gemini-2.5-pro
$CMDRunSQLSolverVerify imdb_13k PostgreSQL gemini-2.5-pro
$CMDRunSQLSolverVerify dsb PostgreSQL gemini-2.5-pro
$CMDRunSQLSolverVerify stackoverflow PostgreSQL gemini-2.5-pro
$CMDRunSQLSolverVerify publicbibenchmark PostgreSQL gemini-2.5-pro
$CMDRunSQLSolverVerify tpch PostgreSQL gemini-2.5-pro