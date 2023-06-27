#!/bin/bash
#SBATCH --time=1:00:00
#SBATCH --mem=10G
#SBATCH --gres=gpu:1
#SBATCH --partition dgx-spa,dgx-common,gpu,gpushort
#SBATCH --constraint=volta

python src_joint/main.py test \
    --dataset ptb \
    --eval-batch-size 8 \
    --consttest-ptb-path data/23.auto.clean \
    --deptest-ptb-path data/ptb_test_3.3.0.sd.clean \
    --embedding-path data/glove.gz \
    --model-path-base best_parser.pt
