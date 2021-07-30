#!/bin/bash
#SBATCH --job-name=trim_lwmales
#SBATCH --partition=batch
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=6G
#SBATCH --time=7-0:00:00
#SBATCH --export=NONE
#SBATCH --output=%x_%j.out
#SBATCH --error=%x_%j.err
#SBATCH --mail-user=bd54845@uga.edu
#SBATCH --mail-type=ALL

ml Trimmomatic/0.33-Java-1.8.0_144

for direct in /scratch/bd54845/geneconversion/LakeWashington_PugetSound_DNASeq_July2016_AliceShanfelter/Run3/lw_males/LW*/
do
  export bam=${direct%%/}
  cd "${direct}"
  for file in *_R1_*
  do
    export output=${file%%1_00*}
    java -jar $EBROOTTRIMMOMATIC/trimmomatic-0.33.jar PE -threads 4 -phred33 -trimlog ${bam}.log -basein ${file} -baseout ${output}_trim.fastq.gz SLIDINGWINDOW:4:20
    echo "$PWD"
  done
done

