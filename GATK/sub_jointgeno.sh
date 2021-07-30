#!/bin/bash
#SBATCH --job-name=jointgeno
#SBATCH --partition=batch
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=16G
#SBATCH --time=7-0:00:00
#SBATCH --export=NONE
#SBATCH --output=%x_%j.out
#SBATCH --error=%x_%j.err
#SBATCH --mail-user=bd54845@uga.edu
#SBATCH --mail-type=ALL

ml GATK/3.8-1-Java-1.8.0_144

java -jar $EBROOTGATK/GenomeAnalysisTK.jar -T GenotypeGVCFs -R /scratch/bd54845/stickleback_v5_assembly.fa --variant LW_10_variants.g.vcf --variant LW_11_variants.g.vcf --variant LW_12_variants.g.vcf --variant LW_13_variants.g.vcf --variant LW_14_variants.g.vcf --variant LW_15_variants.g.vcf --variant LW_16_variants.g.vcf --variant LW_17_variants.g.vcf --variant LW_18_variants.g.vcf --variant LW_19_variants.g.vcf --variant LW_20_variants.g.vcf --variant LW_1_variants.g.vcf --variant LW_2_variants.g.vcf --variant LW_3_variants.g.vcf --variant LW_4_variants.g.vcf --variant LW_5_variants.g.vcf --variant LW_6_variants.g.vcf --variant LW_7_variants.g.vcf --variant LW_8_variants.g.vcf --variant LW_9_variants.g.vcf --variant PS_10_variants.g.vcf --variant PS_12_variants.g.vcf --variant PS_13_variants.g.vcf --variant PS_14_variants.g.vcf --variant PS_15_variants.g.vcf --variant PS_16_variants.g.vcf --variant PS_17_variants.g.vcf --variant PS_18_variants.g.vcf --variant PS_19_variants.g.vcf --variant PS_20_variants.g.vcf --variant PS_1_variants.g.vcf --variant PS_2_variants.g.vcf --variant PS_3_variants.g.vcf --variant PS_4_variants.g.vcf --variant PS_5_variants.g.vcf --variant PS_6_variants.g.vcf --variant PS_7_variants.g.vcf --variant PS_8_variants.g.vcf --variant PS_9_variants.g.vcf -o CombinedPop.vcf
