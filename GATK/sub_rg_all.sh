#!/bin/bash

for file in /scratch/bd54845/geneconversion/trimmedreads/alignment/*MapaQ20.bam
do

sbatch -p batch -t 7-0:00:00 -n 1 --mem=16G --cpus-per-task=1 --job-name rg_all -o %x_%j.out -e %x_%j.out -e %x_%j.err --wrap="sh /scratch/bd54845/geneconversion/trimmedreads/alignment/sub_rg_one.sh $file"

sleep 1

done

