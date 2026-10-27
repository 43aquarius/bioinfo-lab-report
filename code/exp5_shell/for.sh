#!/bin/bash
# 随机产生100个1~100之间的随机数，输出其中大于50的
for i in $(seq 1 100)
do
    num=$((RANDOM % 100 + 1))
    if [ $num -gt 50 ]; then
        echo -n "$num "
    fi
done
echo ""
