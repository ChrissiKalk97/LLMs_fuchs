#!/bin/bash
#SBATCH --job-name=TisTransformer
#SBATCH --partition=fuchs
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=32
#SBATCH --time=2-23:40:00
#SBATCH --mail-type=FAIL
#SBATCH --account=agschulz
#SBATCH --mem=120Gb
srun tis_transformer_on_NMD_transcripts.sh
