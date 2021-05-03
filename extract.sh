#!/bin/bash

if (( $# != 4 )); then
    >&2 echo "usage: ./extract.sh ida_path diaphora_py_path binary_path output_path"
    exit 1
fi

ida_path="$1"
diaphora_path="$2"
binary_path="$3"
output_path="$4"

DIAPHORA_AUTO=1 \
DIAPHORA_EXPORT_FILE="${output_path}" \
"${ida_path}" -A -B -c -S"${diaphora_path}" \
"${binary_path}"
