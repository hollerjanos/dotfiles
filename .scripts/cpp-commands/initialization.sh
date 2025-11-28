#! /usr/bin/env bash

# Configurations

clean="\033[0m"
success="\033[0;32m"
warning="\033[1;33m"

# Introduction

echo "C++ Initialization!"
echo

# Confirmation prompt

read -p "Would you like to continue? [Y|n] " -n 1 -r confirm
echo
confirm=${confirm:-Y}

if [[ "${confirm}" =~ ^[Yy]$ ]]; then
    echo "Continue initializing!"
else
    echo "Initialization has been canceled!"
    exit
fi

# Create directories

folders=("./include" "./src")

for folder in "${folders[@]}"; do
    if [[ ! -d "${folder}" ]]; then
        echo -e "${success}Creating the ${folder} directory.${clean}"
        mkdir ${folder}
    else
        echo -e "${warning}The ${folder} directory already exists.${clean}"
    fi
done

# Create files

files=("./src/main.cpp" "./compile_flags.txt")

for file in "${files[@]}"; do
    if [[ ! -f "${file}" ]]; then
        echo -e "${success}Creating the ${file} file.${clean}"
        cat ~/.scripts/cpp-commands/templates/$(basename ${file}) > ${file}
    else
        echo -e "${warning}The ${file} file alrady exists.${clean}"
    fi
done

# Success

echo -e "Initialization has been finished!"

