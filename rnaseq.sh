#!/bin/bash

#BASH SCRIPT FOR RNASEQ ANALYSIS

#/!\CAUTION/!\ : This script admits fastq compressed files are available in the specified directory
#and it takes 4 threads for several stages of the pipeline.

#Stop pipeline if there is an error
set -e 


###Define variables (directories, softwares, array of data names)
DIR=~/Stage_M1/Drosophila-Suzukii
DIRSOFT=~/Stage_M1/softwares

DIRFASTQ="$DIR"/data/fastq
DIRREF="$DIR"/ref_suzukii
DIRALIGN="$DIR"/aligned_genes
DIRCOUNTREADS="$DIR"/counted_read
DIRCOUNTTE="$DIR"/counted_TE

HISAT2=hisat2
HISAT2BUILD=hisat2-build
SAMTOOLS=samtools
EXPRESS="$DIRSOFT"/express-1.5.1-linux_x86_64/express
TETOOLS="$DIRSOFT"/TEtools/TEcount.py

REF=Drosophila-suzukii-annotation-3

ROSETTETXT="$DIR"/data/rosette/rosette1.txt
ROSETTEFASTA="$DIR"/data/rosette/rosette_fixed.fa

declare -a data
data=(
	'CNVR349_S1'
	'CNVR350_S1'
	'CNVR351_S1'
	'CNVR352_S1'
	'CNVR353_S1'
	'CNVR354_S1'
	'CNVR355_S1'
	'CNVR356_S1'
	'CNVR357_S1'
	'CNVR358_S1'
)


###Create index of the reference genome with hisat2
echo -e "\n*---------- CREATE INDEX"
"$HISAT2BUILD" -p 4 -f "$DIRREF"/"$REF".fasta "$DIRREF"/"$REF""_hisat2.index"


###Gunzip fastq files
for file in ${data[@]}
do
	echo -e "\n*---------- UNZIP FASTQ FILE : ${file}"
	gunzip --keep "$DIRFASTQ"/"$file"".R1.fastq.gz"
	gunzip --keep "$DIRFASTQ"/"$file"".R2.fastq.gz"
done


###Align reads to the reference genome with hisat2
if [ ! -d "$DIRALIGN" ]
then
	mkdir "$DIRALIGN"
fi

for file in ${data[@]}
do
	echo -e "\n*---------- ALIGN READS TO THE REF GENOME : ${file}"
	"$HISAT2" -p 4 -x "$DIRREF"/"$REF""_hisat2.index" -1 "$DIRFASTQ"/"$file"".R1.fastq" -2 "$DIRFASTQ"/"$file"".R2.fastq" -S "$DIRALIGN"/"$file""_hisat2.sam"
done

###Convert SAM files to BAM
for file in ${data[@]}
do
	echo -e "\n*---------- CONVERT TO BAM : ${file}"
	"$SAMTOOLS" view -bS -@ 3 "$DIRALIGN"/"$file""_hisat2.sam" > "$DIRALIGN"/"$file""_hisat2.bam"
	echo -e "\n*---------- REMOVE SAM FILE : ${file}"
	rm "$DIRALIGN"/"$file""_hisat2.sam"
done


###Sort bam files by reads names with samtools
for file in ${data[@]}
do
	echo -e "\n*---------- SORT BAM FILE BY READS NAME : ${file}"
	"$SAMTOOLS" sort -n -o "$DIRALIGN"/"$file""_hisat2_sorted.bam" -@ 4 "$DIRALIGN"/"$file""_hisat2.bam"
	echo -e "\n*---------- REMOVE UNSORTED BAM FILE : ${file}"
	rm "$DIRALIGN"/"$file""_hisat2.bam"
done


###Count reads per gene with express
if [ ! -d "$DIRCOUNTREADS" ]
then
	mkdir "$DIRCOUNTREADS"
fi

for file in ${data[@]}
do
	echo -e "\n*---------- COUNT READS PER GENE : ${file}"
	"$EXPRESS" -o "$DIRCOUNTREADS"/"$file""_express" -O 1 --output-align-prob --calc-covar "$DIRREF"/"$REF".fasta "$DIRALIGN"/"$file""_hisat2_sorted.bam"
done


###Count TE with TEtools
if [ ! -d "$DIRCOUNTTE" ]
then
	mkdir "$DIRCOUNTTE"
fi

for file in ${data[@]}
do
	echo -e "\n*---------- COUNT TE : ${file}"
	python3 "$TETOOLS" -bowtie2 -rosette "$ROSETTETXT" -column 2 -TE_fasta "$ROSETTEFASTA" -count "$DIRCOUNTTE"/"$file""_TEtools.txt" -RNA "$DIRFASTQ"/"$file"".R1.fastq" -RNApair "$DIRFASTQ"/"$file"".R2.fastq" -insert 300 
	echo -e "\n*---------- DELETE UNCOMPRESSED FASTQ FILE : ${file}"
	rm "$DIRFASTQ"/"$file"".R1.fastq"
	rm "$DIRFASTQ"/"$file"".R2.fastq"
done
