#!/bin/bash

root_path="$(pwd)"
data_path="${root_path}/data"
workload_path="${root_path}/workload/MySQL"

imdb_data="${data_path}/imdb"
stats_data="${data_path}/stats"
stats_ceb_data="${data_path}/stats_ceb"
stackoverflow_data="${data_path}/stackoverflow"
tpcds_data="${root_path}/data/tpcds"
tpch_data="${root_path}/data/tpch"
ssb_data="${root_path}/data/ssb"
hits_data="${root_path}/data/hits.csv"
publicbi_data="${root_path}/data/PublicBIbenchmark"


# ## Load IMDB Dataset into MySQL
# # ###################################
cd ${imdb_data}
sudo mysql -e "DROP DATABASE IF EXISTS imdb;"
sudo mysql -e "CREATE DATABASE imdb CHARACTER SET utf8;"
sudo mysql imdb < "${workload_path}/imdb/schema.sql"
sudo mysql imdb < "${workload_path}/imdb/import.sql"
sudo mysql imdb < "${workload_path}/imdb/index.sql"
echo '-------------------<< IMDB database (MySQL) is ready >>-------------------'

# ### Load STATS Dataset into MySQL
# #***********************************
cd ${stats_data}
sudo mysql -e "DROP DATABASE IF EXISTS stats;"
sudo mysql -e "CREATE DATABASE stats;"
sudo mysql stats < "${workload_path}/stats/schema.sql"
sudo mysql stats < "${workload_path}/stats/import.sql"
echo '-------------------<< STATS database (MySQL) is ready >>-------------------'

### Load STATS-CEB Dataset into MySQL
#***********************************
cd ${stats_ceb_data}
sudo mysql -e "DROP DATABASE IF EXISTS stats_ceb;"
sudo mysql -e "CREATE DATABASE stats_ceb;"
sudo mysql stats_ceb < "${workload_path}/stats_ceb/schema.sql"
sudo mysql stats_ceb < "${workload_path}/stats_ceb/import.sql"
sudo mysql stats_ceb < "${workload_path}/stats_ceb/index.sql"
echo '-------------------<< STATS-CEB database (MySQL) is ready >>-------------------'

### Load stackoverflow Dataset into MySQL
### ***********************************
cd ${stackoverflow_data}
sudo mysql -e "DROP DATABASE IF EXISTS stackoverflow;"
sudo mysql -e "CREATE DATABASE stackoverflow;"
sudo mysql stackoverflow < "${workload_path}/stackoverflow/schema.sql"

sudo mysql -e "use stackoverflow; LOAD DATA LOCAL INFILE 'PostHistoryTypes.csv' INTO TABLE PostHistoryTypes COLUMNS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '\"';"
./initpgSQL.sh

sudo mysql -e "use stackoverflow; LOAD DATA LOCAL INFILE 'LinkTypes.csv' INTO TABLE LinkTypes COLUMNS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '\"';"
./initpgSQL.sh

sudo mysql -e "use stackoverflow; LOAD DATA LOCAL INFILE 'PostTypes.csv' INTO TABLE PostTypes COLUMNS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '\"';"
./initpgSQL.sh

sudo mysql -e "use stackoverflow; LOAD DATA LOCAL INFILE 'CloseReasonTypes.csv' INTO TABLE CloseReasonTypes COLUMNS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '\"';"
./initpgSQL.sh

sudo mysql -e "use stackoverflow; LOAD DATA LOCAL INFILE 'VoteTypes.csv' INTO TABLE VoteTypes COLUMNS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '\"';"
./initpgSQL.sh

sudo mysql -e "use stackoverflow; LOAD DATA LOCAL INFILE 'Users.csv' INTO TABLE Users COLUMNS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '\"';"
./initpgSQL.sh

sudo mysql -e "use stackoverflow; LOAD DATA LOCAL INFILE 'Badges.csv' INTO TABLE Badges COLUMNS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '\"';"
./initpgSQL.sh

sudo mysql -e "use stackoverflow; LOAD DATA LOCAL INFILE 'Posts.csv' INTO TABLE Posts COLUMNS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '\"';"
./initpgSQL.sh

sudo mysql -e "use stackoverflow; LOAD DATA LOCAL INFILE 'Comments.csv' INTO TABLE Comments COLUMNS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '\"';"
./initpgSQL.sh

sudo mysql -e "use stackoverflow; LOAD DATA LOCAL INFILE 'PostHistory.csv' INTO TABLE PostHistory COLUMNS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '\"';"
./initpgSQL.sh

sudo mysql -e "use stackoverflow; LOAD DATA LOCAL INFILE 'PostLinks.csv' INTO TABLE PostLinks COLUMNS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '\"';"
./initpgSQL.sh

sudo mysql -e "use stackoverflow; LOAD DATA LOCAL INFILE 'Tags.csv' INTO TABLE Tags COLUMNS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '\"';"
./initpgSQL.sh

sudo mysql -e "use stackoverflow; LOAD DATA LOCAL INFILE 'Votes.csv' INTO TABLE Votes COLUMNS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '\"';"
./initpgSQL.sh
echo '-------------------<< stackoverflow database (MySQL) is ready >>-------------------'