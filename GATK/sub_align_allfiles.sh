#!/bin/bash

for dir in /scratch/bd54845/geneconversion/trimmedreads/reads/*
do

sbatch -p batch -t 7-0:00:00 -n 1 --mem=6G --cpus-per-task=1 --job-name align_all -o %x_%j.out -e %x_%j.out -e %x_%j.err --wrap="sh /scratch/bd54845/geneconversion/trimmedreads/sub_align_onefile.sh $dir"

sleep 1

done
