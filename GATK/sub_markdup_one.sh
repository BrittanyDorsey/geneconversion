#!/bin/bash

file=$1

base=`basename $file`

ml picard/2.21.6-Java-11
ml SAMtools/1.10-GCC-8.3.0

export iden=${file%%_RG.*}
export output=${base}_mdup.bam
export met=${base}.metrics.txt

java -Xmx20g -jar $EBROOTPICARD/picard.jar MarkDuplicates REMOVE_DUPLICATES=true I=${file} O=${output} M=${met}
samtools index -b ${output}
