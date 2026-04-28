# ReSequel: Robust LLM-assisted Query Rewriting and Optimization using Templatization and Sampling
This repository is a simplified version of the main  `ReSequel` repository, prepared for `VLDB 2026`. In the Project Structure section, we outline the contents of the repository. At the root level, there is a `src` folder containing the core implementation of `ReSequel`, and an `Experiments` folder with scripts for running `ReSequel` and the baselines.

We have also included the workloads used in the paper, all of which are open-source. Due to space limitations, we did not include the baseline code directly, but we provide links to their open repositories in the setup section.

A step-by-step guide for installation and execution is provided at the end.


## Project Structure

```bash
.
├── src
│   ├── main
│   │   ├── python
│   │   │   ├── main.py    
│   │   │   ├── catalog
│   │   │   │   ├── Catalog.py
│   │   │   ├── Database
│   │   │   │   ├── Database.py
│   │   │   ├── llm
│   │   │   │   ├── GenerateLLMGemini.py
│   │   │   │   ├── GenerateLLMGroq.py
│   │   │   │   ├── ImplementFunction.py
│   │   │   │   ├── OptimizeLLMSQL.py
│   │   │   │   └── OptimizeSQL.py
│   │   │   ├── prompt
│   │   │   │   ├── BasicPrompt.py
│   │   │   │   ├── ErrorPromptTemplate.py
│   │   │   │   ├── GenerateQueriesPrompt.py
│   │   │   │   ├── ImplementPrompt.py
│   │   │   │   ├── PromptBuilder.py
│   │   │   │   ├── PromptTemplate.py
│   │   │   │   └── VerifyQueriesPrompt.py
│   │   │   ├── runquery
│   │   │   │   └── Templatizer_compile.py
│   │   │   ├── util
│   │   │   │   ├── Config.py
│   │   │   │   ├── ErrorResults.py
│   │   │   │   ├── FileHandler.py
│   │   │   │   ├── LLM_API_Key.py
│   │   │   │   └── LogResults.py
│   │   │   └── verify
│   │   │       └──Downsampling_main.py
    │   │
│   │   ├── cpp // downsampling implementation
    │   │
│   │   └── resources
│   └── test
│
└── Experiments
    ├── baselines
    ├── catalog (extracted metada from DB - JSON files)
    │   ├── imdb // JOB
    │   ├── imdb_13k // IMDB Full
    │   ├── publicbibenchmark
    │   ├── stackoverflow
    │   ├── stats
    │   ├── stats_ceb 
    │   ├── tpch
    │   └── dsb 
    │ 
    ├── explocal (scripts for running experiments)
    │   ├── exp1_ReSequel
    │   │   ├── runExperiment1-BuildCatalog.sh
    │   │   ├── runExperiment1-Downsampling.sh
    │   │   ├── runExperiment1-Reconstruct.sh
    │   │   ├── runExperiment1-ReSequel.sh
    │   │   ├── runExperiment1.sh
    │   │   ├── runExperiment1-Templatization.sh
    │   │   └── runExperiment1-Verify.sh
    │   │
    │   └── exp2_Baselines
    │       ├── runExperiment2-LearnRewrite.sh
    │       ├── runExperiment2-LLM-R2.sh
    │       ├── runExperiment2-R-Bot.sh 
    │       ├── runExperiment2-ReSequel.sh
    │       ├── runExperiment2.sh
    │       ├── runExperiment2-Verify-LearnRewrite.sh
    │       ├── runExperiment2-R-Bot.sh 
    │       └── runExperiment2-Verify-LLM-R2.sh
    │
    ├── initMySQL.sh
    ├── initpgSQL.sh
    ├── run1SetupDependencies.sh
    ├── run2SetupBaseLines.sh
    ├── run3DownloadData.sh
    ├── run4GenerateData.sh
    ├── run5PrepareData-DuckDB.sh
    ├── run5PrepareData-MySQL.sh
    ├── run5PrepareData-PostgreSQL.sh
    ├── run6LocalExperiments.sh
    ├── run7LocalExperimentsBaselines.sh
    ├── runAll.sh
    └── workload
        ├── PostgreSQL
        │   ├── imdb (113 queries + DB Schema)
        │   ├── imdb-template (Extracted by our system)
        │   ├── imdb_13k (13,646 queries + DB Schema)
        │   ├── imdb_13k-template (Extracted by our system)
        │   ├── publicbibenchmark (100 queries + DB Schema)
        │   ├── publicbibenchmark-template
        │   ├── stackoverflow (1192 queries + DB Schema)
        │   ├── stackoverflow-template
        │   ├── stats (146 queries + DB Schema)
        │   ├── stats-template
        │   ├── stats_ceb (146 queries + DB Schema)
        │   ├── stats_ceb-template
        │   ├── dsb (52 queries + DB Schema)
        │   ├── dsb-template
        │   ├── tpch (22 queries + DB Schema)
        │   └── tpch-template
        ├── MySQL
        │   └──  *** SAME AS PostgreSQL ***
        └── DuckDB
           └──  *** SAME AS PostgreSQL ***    
```

**Hardware and Software Info:** We ran all experiments on a server node (VM) with an Intel Core CPU (with 32 vcores) and 150 GB of DDR4 RAM. The software stack consisted of Ubuntu 22.04, OpenJDK 11 (for Java baselines), PostgreSQl 17.1, MySQL 8, DuckDB, and Python 3.10, JDB 11, and C++17.

**Setup and Experiments:** The repository is pre-populated with the paper's experimental results (`./results`). The entire experimental evaluation can be run via `./runAll.sh`, which deletes the results and performs setup, dataset download, dataset preparation, dataset generating, local experiments. However, for a more controlled evaluation, we recommend running the individual steps separately.

There are three baselines used in our paper. Here is a public repository available for installing and running the baselines. However, in our system, we made a few simple modifications to run them:
 
 **1. LearnedRewrite Baseline:** [https://github.com/XuanheZhou/LearnedRewrite](https://github.com/XuanheZhou/LearnedRewrite)

**2. LLM-R2 Baseline:** [https://github.com/DAMO-NLP-SG/LLM-R2](https://github.com/DAMO-NLP-SG/LLM-R2)

**3. R-Bot Baseline:** [https://github.com/curtis-sun/LLM4Rewrite](https://github.com/curtis-sun/LLM4Rewrite)


### Step 1: Dependency Setup
--- 
The `./run1SetupDependencies.sh` script installs all the required dependencies. Here is a brief overview of each dependency and its purpose:

* **JDK 11**: for Java-based baselines (LearnedRewrite, LLM-R2, R-Bot)
* **unzip**, **unrar**, and **xz-utils**: for decompressing datasets
* **python3.10**: for python-based baselines
* **C++17**: for our downsampling system
* **PostgreSQl 17, MySQL 8, and DuckDB**: all host DBMSs

### Step 2: Baselines Setup and Config
--- 
The `./run2SetupBaseLines.sh` script will automatically compile Java, and Python based implementations and set up the runnable apps in the `Setup` directory. There is no need for manual effort in this process.

For LLM-based baselines, you need to set API keys for the LLM services (Google Gemini, and Groq). For each service, create an API key using the following links:

* **Google Gemini**:[https://aistudio.google.com/](https://aistudio.google.com/)
* **Groq (gpt-oss-120b)**: [https://console.groq.com/](https://console.groq.com/)

The API keys must be set in the following path:

* **ReSequel Setup Path**:
```
# Path:
Experiments/stup/Baselines/ReSeque/APIKeys.yaml

# Content:
---

- llm_platform: Groq
  key_1: 'YOUR KEY'

- llm_platform: Google
  key_1 : 'YOUR KEY'
```

### Step 3: Download Datasets
---
* **TPC-H**: [https://github.com/gregrahn/tpch-kit](https://github.com/gregrahn/tpch-kit)
* **DSB**: [https://github.com/microsoft/dsb](https://github.com/microsoft/dsb)
* **IMDB**: [https://dataverse.harvard.edu/dataset.xhtml?persistentId=doi:10.7910/DVN/2QYZBT](https://dataverse.harvard.edu/dataset.xhtml?persistentId=doi:10.7910/DVN/2QYZBT)
* **Stats**: [https://github.com/rbergm/PostBOUND/tree/b731b03115862db6c994ad4be43312d47dfd421e](https://github.com/rbergm/PostBOUND/tree/b731b03115862db6c994ad4be43312d47dfd421e)
* **Stats-CEB**: [https://github.com/Nathaniel-Han/End-to-End-CardEst-Benchmark](https://github.com/Nathaniel-Han/End-to-End-CardEst-Benchmark)
* **StackOverflow**: [https://github.com/SQL-Storm/SQLStorm](https://github.com/SQL-Storm/SQLStorm)
* **Public BI Benchmark**: [https://github.com/cwida/public_bi_benchmark](https://github.com/cwida/public_bi_benchmark)

### Step 4: Run Experiments
--- 
The `./run6LocalExperiments.sh` and `./run6LocalExperimentsBaselines.sh` scripts are responsible for running all experiments. For each experiment, we have planned to execute it five times and store the experimental results in the `results` directory.

### All Scripts: ```./runAll.sh```
--- 

```
./run1SetupDependencies.sh;
./run2SetupBaseLines.sh;
./run3DownloadData.sh;
./run4GenerateData; # for TPC-H and DSB

# Create Database and Import Data -- If database exist it will delete it
./run5PrepareData-DuckDB.sh; # Create Database and Import Data into DuckDB
./run5PrepareData-MySQL.sh; # Create Database and Import Data into MySQL
./run5PrepareData-PostgreSQL.sh; # Create Database and Import Data into PostgreSQL 

./run6LocalExperiments.sh; # Run all experiments related to ReSequel
./run7LocalExperimentsBaselines.sh # Run baseline expriments
```