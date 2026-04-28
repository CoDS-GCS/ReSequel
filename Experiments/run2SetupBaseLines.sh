#!/bin/bash

root_path="$(pwd)"
data_path="${root_path}/data"
path="${root_path}/setup"
baseline_path="${path}/Baselines"
pg_config="${path}/PGConfigs/PG-32-148-35.conf"

mkdir -p ${baseline_path}
mkdir -p ${data_path}

cd ${baseline_path}
rm -rf GDB

git clone https://github.com/fathollahzadeh/GDB.git
cd GDB

### Install PostgreSQL 17.1
###***************************
cd Install-Postgres-v17.1
./setup.sh ${baseline_path} "${data_path}"
cd ${root_path}
./initpgSQL.sh

sleep 5

psql -U postgres -c "\i ${pg_config}"

./initpgSQL.sh
sleep 3

### Install MySQL
#*****************
sudo apt-get install -y mysql-server-8.0
sudo bash -c "echo -e '[mysql]\nlocal-infile=1\n\n[mysqld]\nlocal-infile=1\n' > /etc/mysql/conf.d/local_infile.cnf"
sudo service mysql restart

sudo mysql -e "CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin';"
sudo mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'admin'@'localhost' WITH GRANT OPTION;"
sudo mysql -e "FLUSH PRIVILEGES;"

### Install DouckDB
#*******************
export CC=clang
export CXX=clang++

cd ${baseline_path}
git clone https://github.com/duckdb/duckdb
cd duckdb
git checkout v1.2-histrionicus
GEN=ninja NATIVE_ARCH=1 LTO=thin make
cd ..

### Install TPC-H Dataset Generator
###**********************************
cd "${baseline_path}/GDB/TPC-H"
./run1Compile.sh

### Install DSB Dataset Generator
cd "${baseline_path}/GDB/DSB"
./run1Compile.sh


### Setup ReSequel
#******************
resql_path="${path}/Baselines/ReSequel/"
rm -rf ${resql_path}
mkdir -p ${resql_path}

cd ${root_path}
cd ..
cp -r src/main/python/* ${resql_path}
cd ${resql_path}

rm -rf venv 
python3.10 -m venv venv
source venv/bin/activate
pip install --upgrade pip
pip install -r requirements.txt

### Setup Workload Executor:
#*************************
wl_path="${path}/Baselines/Workload/"
rm -rf ${wl_path}
mkdir -p ${wl_path}

cd ${root_path}
cd baselines
cp -r Workload/* ${wl_path}
cd ${wl_path}

rm -rf venv 
python3.10 -m venv venv
source venv/bin/activate
pip install --upgrade pip
pip install -r requirements.txt


### Setup Baselines (LearnRewrite and LLM-R2)
#*******************************************
lr_path="${path}/Baselines/LearnRewrite/"
rm -rf ${lr_path}
mkdir -p ${lr_path}

cd ${root_path}
cd baselines
cp -r LearnRewrite/* ${lr_path}
cd ${lr_path}

set -e  # stop on first error
pip3.10 cache purge
rm -rf venv
python3.10 -m venv venv
source venv/bin/activate

export PATH="$HOME/.cargo/bin:$PATH"
export CARGO="$HOME/.cargo/bin/cargo"

pip install --upgrade pip setuptools wheel setuptools-rust
rm -rf ~/.cargo/registry ~/.cargo/git
pip install --no-build-isolation -r requirements.txt

### setup R-Bot
#**************
cd ${baseline_path}
rbot_path="${path}/Baselines/R-Bot/"
rm -rf ${rbot_path}
mkdir -p ${rbot_path}

git clone -b ReSequel https://github.com/fathollahzadeh/R-Bot.git
cd ${rbot_path}

cd rag
unzip stackoverflow-rewrite-embed.zip
# Build structure-semantics Q&A index.
python3 rag_gen.py
# (Optional) Build structure-only Q&A index.
python3 rag_structure.py
# (Optional) Build semantics-only Q&A index.
python3 rag_semantics.py

cd ${rbot_path}
 rm -rf venv
 python3.10 -m venv venv
 source venv/bin/activate
 pip install --upgrade pip
 pip install -r requirements.txt

### Install SQLSolver Baseline
#*****************************
cd ${baseline_path}
sqlsolver_path="${path}/Baselines/SQLSolver/"
rm -rf ${sqlsolver_path}


cd ${root_path}
cd baselines
cp -r SQLSolver ${baseline_path}
cd ${sqlsolver_path}

mvn clean install
