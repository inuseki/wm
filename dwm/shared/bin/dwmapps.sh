#!/usr/bin/env bash

## Copyright (C) 2020-2022 Aditya Shakya <adi1090x@gmail.com>
## Everyone is permitted to copy and distribute copies of this file under GNU-GPL3

## Launch Applications

if [[ "$1" == "--file" ]]; then
	lf
elif [[ "$1" == "--editor" ]]; then
	vim
elif [[ "$1" == "--web" ]]; then
	firefox
fi
