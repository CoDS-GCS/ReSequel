#!/bin/bash

root_path="$(pwd)"
data_path="${root_path}/data"

mkdir -p ${data_path}

cd ${data_path}
rm -rf datasets
git clone https://github.com/fathollahzadeh/datasets.git

rm -rf "${data_path}/stats"
rm -rf "${data_path}/imdb"
rm -rf "${data_path}/PublicBIbenchmark"
mkdir "${data_path}/stats"
mkdir "${data_path}/PublicBIbenchmark"

# cd datasets/stats
unzip part-1.zip
unzip part-2.zip

mv part-1/* "${data_path}/stats"
mv part-2/* "${data_path}/stats"

cd ${data_path}
cd datasets/IMDB-JOB

rm -rf venv 
python3.10 -m venv venv
source venv/bin/activate
pip install -r requirements.txt

python merge.py

unzip imdb.zip
mv imdb $data_path


### Download PublicBIbenchmark
db_list="Arade,Bimbo,CityMaxCapita,CMSprovider,CommonGovernment,Corporations,Eixo,Euro2016,Food,Generico,HashTags,Hatred,IGlocations1,IGlocations2,IUBLibrary,Medicare1,Medicare2,Medicare3,MedPayment1,MedPayment2,MLB,Motos,MulheresMil,NYC,PanCreactomy1,PanCreactomy2,Physicians,Provider,RealEstate1,RealEstate2,Redfin1,Redfin2,Redfin3,Redfin4,Rentabilidad,Romance,SalariesFrance,TableroSistemaPenal,Taxpayer,Telco,TrainsUK1,TrainsUK2,Uberlandia,USCensus,Wins,YaleLanguages"

dst_dir="${data_path}/"

cd datasets/PublicBIbenchmark
./runAll.sh $db_list $dst_dir


### Download StackOverflow Dataset
#**********************************
cd ${data_path}

# 12GB
rm -rf stackoverflow_math.tar.gz
wget https://db.in.tum.de/~schmidt/data/stackoverflow_math.tar.gz
tar -xzvf stackoverflow_math.tar.gz
mv stackoverflow_math stackoverflow

