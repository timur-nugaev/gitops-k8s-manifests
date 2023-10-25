#!/bin/bash
values=""
for config in "$@"; do
    configfolder="configurations/$config"
    for file in "$configfolder"/*.yaml; do
        values="$values -f $file"
    done
done
helm template ./charts/saca/ -f ./configurations/base/values.yaml $values