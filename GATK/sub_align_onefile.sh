#!/bin/bash/

#initialize
dir=$1

base=`basename $dir`
echo "name is $base"

genome=/scratch/bd54845/geneconversion/trimmedreads/stickleback

align_location=/scratch/bd54845/geneconversion/trimmedreads/alignment
align_name=/scratch/bd54845/geneconversion/trimmedreads/alignment/${base}.sam

ml Bowtie2/2.4.1-GCC-8.3.0

cd "${dir}"

export read1_list=`ls -m *1P* | tr -d ' \n'`
export read2_list=`ls -m *2P* | tr -d ' \n'`

bowtie2 -p 4 --no-unal -x $genome \
        -1 ${read1_list} \
        -2 ${read2_list} \
        -S $align_name
