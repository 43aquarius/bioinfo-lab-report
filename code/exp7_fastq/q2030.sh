#!/bin/bash
# 计算 fastq 文件里质量值大于20(Q20)和大于30(Q30)的碱基比例
if [ $# -lt 1 ]; then
    echo "Usage: $0 <in.fastq>"
    exit 1
fi
awk 'BEGIN{for(i=0;i<256;i++) ord[sprintf("%c",i)]=i}
NR%4==0{
    n=length($0); total+=n
    for(i=1;i<=n;i++){
        q=ord[substr($0,i,1)]-33
        if(q>30) q30++
        else if(q>20) q20++
    }
} END{
    printf "碱基总数:   %d\n", total
    printf "Q20 比例:   %.2f%%\n", (q20+q30)/total*100
    printf "Q30 比例:   %.2f%%\n", q30/total*100
}' "$1"
