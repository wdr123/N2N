#!/bin/bash
base_job_name="RAM_Sep_20"
job_file="the_job.sh"
identifier_name="RAM_2d_3d"
dir="op"$identifier_name
mkdir -p $dir
# Declare a string array with type
declare -a StringArray=("2d" "3d")
for gl in "${StringArray[@]}"; do
for seed in {1..5..1}; do
#for split in $(seq 0.4 0.1 0.8); do
for split in $(seq 0.6 0.1 0.6); do
for latent in {128,256,512}; do
  export seed latent split gl
  export first="$1" second="$2"
  job_name=$base_job_name-$((first))-$((second))-$((latent))-$((seed))"-"$split"-"$gl
  out_file=$dir/$base_job_name-$((latent))-$((seed))"-"$split"-"$gl.out
  error_file=$dir/$base_job_name-$((latent))-$((seed))"-"$split"-"$gl.err

  echo $seed $latent $first $second $split $gl
  sbatch -J $job_name -o $out_file -t 1-00:00:00 -p tier3 -e $error_file $job_file
done
done
done
done
