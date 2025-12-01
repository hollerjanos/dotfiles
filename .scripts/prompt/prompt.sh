#! /usr/bin/env bash

# Set the question

question="Are you sure?"
if [[ ! -z "${1}" ]]; then
    question=${1}
fi


while getopts 'q:h' flag; do
    case "${flag}" in
        q) question="${OPTARG}" ;;
        h|*) printUsage; exit 1 ;;
    esac
done

read -p "${question} [Y|n] " -n 1 -r -s confirm
echo
confirm=${confirm:-Y}

if [[ "${confirm}" =~ ^[Yy]$ ]]; then
    exit 0 # true
else
    exit 1 # false
fi

