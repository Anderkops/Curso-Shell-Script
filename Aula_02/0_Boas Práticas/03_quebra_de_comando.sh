#!/usr/bin/env bash

find / -iname "*.so" \
    -user anderson \
    -type f \
    -size +1M \
    -exec ls {} \;
