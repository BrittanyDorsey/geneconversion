#!/bin/bash

file=$1

ml GATK/3.8-1-Java-1.8.0_144

n=${file%_*_MapaQ20.bam_RG.bam_mdup.bam.realigned.bam*}
output=${n}_variants.g.vcf

java -jar $EBROOTGATK/GenomeAnalysisTK.jar -R /scratch/bd54845/stickleback_v5_assembly.fa -T HaplotypeCaller -I ${file} --genotyping_mode DISCOVERY --emitRefConfidence GVCF -o ${output}
