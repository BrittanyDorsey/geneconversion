#!/bin/bash

file=$1

base=`basename $file`

ml GATK/3.8-1-Java-1.8.0_144

export iden=${file%%_mdup.*}
export int=${iden}.intervals
export out=realigned${iden}.bam

java -jar $EBROOTGATK/GenomeAnalysisTK.jar -T RealignerTargetCreator -R /scratch/bd54845/stickleback_v5_assembly.fa -I ${file} -o ${int}
java -jar $EBROOTGATK/GenomeAnalysisTK.jar -T IndelRealigner -R /scratch/bd54845/stickleback_v5_assembly.fa -I ${file} -targetIntervals ${int} -o ${base}.realigned.bam
