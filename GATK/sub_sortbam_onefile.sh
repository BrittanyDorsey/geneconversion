#!/bin/bash

file=$1

ml SAMtools/1.10-GCC-8.3.0

export iden=${file%%.*}
samtools sort -o ${iden}_sort.bam -T ${iden}_s -@ 24 ${iden}_unsort.bam
mv ${iden}_sort.bam ${iden}.bam
samtools index -b ${iden}.bam
