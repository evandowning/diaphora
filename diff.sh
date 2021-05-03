#!/bin/bash

if (( $# != 2 )); then
    >&2 echo "usage: ./diff.sh files.txt output/"
    exit 1
fi

inFN="$1"
outFolder="$2"

mkdir -p "$outFolder"

# From https://stackoverflow.com/questions/45836584/bash-all-combinations-of-lines#45836707
awk -v outFolder="${outFolder}/" '{ a[NR]=$0 }                  # index on NR
    END {
        for(i=1;i<=NR;i++) {
            for(j=i+1;j<=NR;j++) {     # j=i+1 is the magic
                n=split(a[i],b,"/")
                m=split(a[j],c,"/")
                out=b[n] "_" c[m]
                print "python3 diaphora.py" " " a[i] " " a[j] " " "-o " outFolder out
            }
        }
}' "$inFN"
