#!/bin/bash

# Settings
host="127.0.0.1:20408"
config="/opt/labgrid-exporter/config.yaml"

if [[ ! -z "${1}" ]]; then
    host=${1}
fi

if [[ ! -z "${2}" ]]; then
    config=${2}
fi

# start exporter
exec labgrid-exporter -n default -x ws://${host}/ws ${config}
