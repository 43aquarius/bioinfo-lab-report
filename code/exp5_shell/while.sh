#!/bin/bash
# while 循环版本：随机产生100个1~100的随机数，输出大于50的
count=0
while [ $count -lt 100 ]
do
    num=$((RANDOM % 100 + 1))
    if [ $num -gt 50 ]; then
        echo -n "$num "
    fi
    count=$((count + 1))
done
echo ""
