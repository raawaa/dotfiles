#!/usr/bin/env bash

for f in "$@"; do
    convert -verbose $f -crop "+0+64" -trim +repage -resize "900x900>" ${f%.*}_trim_small.jpg && rm -v $f
done
