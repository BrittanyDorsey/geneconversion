#!/bin/bash

file=$1

ml SAMtools/1.10-GCC-8.3.0

export iden=${file%%.*}
samtools view -@ 36 -bq 20 ${file} > ${iden}_MapaQ20.bam
