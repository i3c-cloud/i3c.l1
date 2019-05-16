#!/bin/bash

cd /i3c/data/$1
. env.sh
terraform "${@:2}";