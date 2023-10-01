#!/bin/bash -lT


#SBATCH --mail-user=986739772@qq.com
#SBATCH --mail-type=ALL
#SBATCH -A vision -p tier3 -n 4
#SBATCH -c 2
#SBATCH --mem=16g
#SBATCH --gres=gpu:a100:2

conda activate N2N


# if [[ $first = "no_attention" ]]; then
#       python RAM_ASD_TD_train_test.py --latent $latent --model no_attention --seed $seed --split $split --gl $gl
#   elif [[ $first = "attention_only" ]]; then
#       python RAM_ASD_TD_train_test.py --latent $latent --model attention_only --seed $seed
#   elif [[ $second = "multiple" ]]; then
#       python RAM_ASD_TD_train_test.py --latent $latent --model combine --attention multiple --seed $seed
#   elif [[ $second = "combine" ]]; then
#       python RAM_ASD_TD_train_test.py --latent $latent --model combine --attention combine --seed $seed --split $split --gl $gl
#   elif [[ $second = "sequential10" ]]; then
#         python RAM_ASD_TD_train_test.py --latent $latent --model combine --attention sequential --seed $seed
#   elif [[ $second = "sequential20" ]]; then
#         python RAM_ASD_TD_train_test.py --latent $latent --model combine --attention sequential --selen 20 --seed $seed
# fi

