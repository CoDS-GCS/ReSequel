#!/usr/bin/env bash
./build.sh;
./build_catalog.sh tpch
./build_catalog.sh imdb  # JOB
./build_catalog.sh imdb_13k  # Full IMDB 
./build_catalog.sh stats
./build_catalog.sh stats_ceb
./build_catalog.sh publicbibenchmark
./build_catalog.sh stackoverflow
./build_catalog.sh dsb





