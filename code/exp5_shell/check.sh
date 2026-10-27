#!/bin/bash
# 检查当前目录下是否有 test.txt
if [ -f test.txt ]; then
    echo "test.txt already exist"
else
    touch test.txt
    echo "test.txt created"
fi
