#! /usr/bin/env bash

if [[ ! -d "include" ]]; then
    echo "Error: The 'include' folder does NOT exist!"
    exit 1
fi

if [[ ! -d "src" ]]; then
    echo "Error: The 'src' folder does NOT exist!"
    exit 1
fi

nvim -S ~/scripts/nvimcpp/nvimcpp.vim

