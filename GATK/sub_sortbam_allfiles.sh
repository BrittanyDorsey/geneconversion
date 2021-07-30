#!/bin/bash

for file in /scratch/bd54845/geneconversion/trimmedreads/alignment/*.sam
do

sbatch -p batch -t 7-0:00:00 -n 1 --mem=32G --cpus-per-task=1 --job-name sortindex_all -o %x_%j.out -e %x_%j.out -e %x_%j.err --wrap="sh /scratch/bd54845/geneconversion/trimmedreads/alignment/sub_sortbam_onefile.sh $file"

sleep 1

done

