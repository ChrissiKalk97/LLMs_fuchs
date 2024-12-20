#!/bin/bash -l
PATH="/home/fuchs/agschulz/kalk/miniforge3/bin:$PATH"
source /home/fuchs/agschulz/kalk/.bashrc
source /home/fuchs/agschulz/kalk/miniforge3/etc/profile.d/conda.sh
eval "$(conda shell.bash hook)"
source activate transcript_transformer 

. ~/spack/share/spack/setup-env.sh
spack load bioawk

transcript_path="/scratch/fuchs/agschulz/kalk/SplitORF/TIS_transformer/NMD_transcripts_110"

bioawk -c fastx '{if (length($seq) < 1000) print ">"$name"\n"$seq}' $transcript_path/NMD_transcripts_CDNA.fa > $transcript_path/NMD_transcripts_CDNA_filtered.fa

transcript_transformer predict $transcript_path/NMD_transcripts_CDNA_filtered.fa fa ./TIS_transformer_L_1.ckpt --save_path $transcript_path/predictions/L_1