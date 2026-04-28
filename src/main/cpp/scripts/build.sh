#!/usr/bin/env bash

set -euo pipefail

cd ..
# Clean-up
rm -rf build
rm -rf bin
mkdir -p build
cd build

# Configure
echo "===== Configuring ====="
cmake .. -DCMAKE_BUILD_TYPE=Release

# Build
echo "===== Building ====="
cmake --build . -j$(nproc)


