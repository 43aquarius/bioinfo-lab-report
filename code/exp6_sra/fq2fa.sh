#!/bin/bash
# 把 fastq 转成 fasta：每4行取前2行，@开头改成>
if [ $# -lt 1 ]; then
    echo "Usage: $0 <in.fastq> [out.fasta]"
    exit 1
fi
in_fq=$1
out_fa=${2:-${in_fq%.*}.fa}
awk -v OFS="" 'NR%4==1{sub(/^@/,">");print} NR%4==2{print}' "$in_fq" > "$out_fa"
echo "done: $out_fa"
