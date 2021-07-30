#README for GATK scripts folder on OSF
#Author: Alice Shanfelter, July 2018

#files and pipeline order

1. Trim_example.sh <- trim sequences using trimmomatic to remove residual adapters and low-quality regions

2. Align_example.sh <- align trimmed sequences to genome assembly using bowtie2

3. SortBam_example.sh <- sort bam file using samtools as later stages of analysis need sorted bams

4. MapQ_example.sh <- filter for map quality using samtools

5. GenomeCov_example.sh <- calculate genome coverage (optional step); can be useful for determining if filter quality, alignments, or even sequencing worked

6. AddRG_example.sh <- add read groups using GATK best practices; these need to be different enough that samples can be differentiated

7. MarkDups_example.sh <- mark duplicates using GATK best practices

8. Indels_example.sh <- realign around indels using GATK best practices

9. CallVars_example.sh <- call variants for each individual using GATK best practices

10. JointGeno_example.sh <- joint genotype by population,sex, etc. depending on what you want to do; here I joint genotyped by population; uses GATK best practices
