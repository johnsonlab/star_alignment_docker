#!/bin/bash

script_dir=$(dirname "$(realpath "$0")")
cd "${script_dir}/.."

#GENOMEDIR="./genome/M37"
GENOMEDIR="./genome/H48"

mkdir -p ${GENOMEDIR}

(
    cd ${GENOMEDIR}
    # download the "Genome sequence, primary assembly (GRCm39)" fasta file
    # Changed to human GRCh38
    [ -f GRCh38.primary_assembly.genome.fa.gz ] || \
    #[ -f GRCm39.primary_assembly.genome.fa.gz ] || \
        wget ftp://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_human/release_48/GRCh38.primary_assembly.genome.fa.gz
  #      wget ftp://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_mouse/release_M37/GRCm39.primary_assembly.genome.fa.gz
    # filter it as described in the note below
    # download the annotations that correspond to it 
    [ -f gencode.v48.primary_assembly.annotation.gtf.gz ] || \
    #[ -f gencode.vM37.primary_assembly.annotation.gtf.gz ] || \
        wget ftp://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_human/release_48/gencode.v48.primary_assembly.annotation.gtf.gz
        #wget ftp://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_mouse/release_M37/gencode.vM37.primary_assembly.annotation.gtf.gz

    gunzip -c GRCh38.primary_assembly.genome.fa.gz > GRCh38.primary_assembly.genome.fa
    gunzip -c gencode.v48.primary_assembly.annotation.gtf.gz > gencode.v48.primary_assembly.annotation.gtf

)

mkdir -p ${GENOMEDIR}/STAR
STAR --runThreadN 4 --runMode genomeGenerate \
    --genomeDir ${GENOMEDIR}/STAR \
    --genomeFastaFiles ${GENOMEDIR}/GRCm39.primary_assembly.genome.fa \
    --sjdbGTFfile ${GENOMEDIR}/gencode.v48.primary_assembly.annotation.gtf.gz \
