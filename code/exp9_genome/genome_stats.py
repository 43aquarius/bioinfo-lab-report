#!/usr/bin/env python3
"""genome_stats.py — 参考基因组基本统计：条数、总长、最长、N50、L50、GC含量"""
import sys

def load_lengths(fname):
    lengths, n_bases, gc_bases, cur = [], 0, 0, 0
    with open(fname) as f:
        for line in f:
            if line.startswith(">"):
                if cur:
                    lengths.append(cur)
                cur = 0
            else:
                s = line.strip().upper()
                cur += len(s)
                gc_bases += s.count("G") + s.count("C")
                n_bases += s.count("N")
    if cur:
        lengths.append(cur)
    return lengths, n_bases, gc_bases

def n50_l50(lengths):
    total = sum(lengths)
    acc = 0
    for i, L in enumerate(sorted(lengths, reverse=True), 1):
        acc += L
        if acc * 2 >= total:
            return L, i
    return 0, 0

def main(fname):
    lengths, n_bases, gc_bases = load_lengths(fname)
    total = sum(lengths)
    n50, l50 = n50_l50(lengths)
    print(f"参考基因组文件名:    {fname}")
    print(f"序列条数:            {len(lengths)}")
    print(f"基因组总长 (Mb):     {total/1e6:.2f}")
    print(f"最长序列 (Mb):       {max(lengths)/1e6:.2f}")
    print(f"N50 (Mb):            {n50/1e6:.2f}")
    print(f"L50:                 {l50}")
    print(f"GC含量 (%):          {gc_bases/total*100:.2f}")
    print(f"N碱基数量:           {n_bases} ({n_bases/total*100:.3f}%)")

if __name__ == "__main__":
    main(sys.argv[1] if len(sys.argv) > 1 else "GCF_000146045.2_R64_genomic.fna")
