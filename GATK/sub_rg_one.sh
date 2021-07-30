#!/bin/bash

file=$1

ml picard/2.21.6-Java-11

export iden=${file%%_Map.*}
export output=${iden}_RG.bam
export ID=HH5TGBX2.${iden}
export LB=Lib.${iden}.1_4
export PU=HH5TGBX2.1_4.${iden}

java -Xmx20g -XX:ParallelGCThreads=24 -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=${file} O=${output} RGID=${ID} RGLB=${LB} RGPL=ILLUMINA RGPU=${PU} RGSM=${iden}
