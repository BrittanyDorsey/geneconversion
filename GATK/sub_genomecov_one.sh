#!/bin/bash

file=$1

ml BEDTools/2.29.2-GCC-8.3.0

export iden=${file%%.*}
bedtools genomecov -ibam ${file} -g /scratch/bd54845/stickleback_v5_assembly.fa > ${iden}.log

