#!/bin/bash

commands=( "wget" "curl" "htop" "vim" "nvim" "go" "python" "python3" )

for item in "${commands[@]}"
do
    if command -v "$item" &> /dev/null; then
        word="yes"
    else
        word="no"
    fi
    printf "%-15s%s\n" "$item" "$word"
done

if command -v python &> /dev/null && python -m pip &> /dev/null; then
    printf "%-15s%s\n" "python pip" "yes"
else
    printf "%-15s%s\n" "python pip" "no"
fi

if command -v python3 &> /dev/null && python3 -m pip &> /dev/null; then
    printf "%-15s%s\n" "python3 pip" "yes"
else
    printf "%-15s%s\n" "python3 pip" "no"
fi

