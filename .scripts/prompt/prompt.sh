#! /usr/bin/env bash

# Set the question

question="Are you sure?"
if [[ ! -z "${1}" ]]; then
    question=${1}
fi

read -p "${question} [Y|n] " -n 1 -r -s confirm
echo
confirm=${confirm:-Y}
echo

if [[ "${confirm}" =~ ^[Yy]$ ]]; then
    exit 0 # true
else
    exit 1 # false
fi

