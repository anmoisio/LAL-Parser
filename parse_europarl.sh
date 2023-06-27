#!/usr/bin/env bash
#SBATCH --time=2-00
#SBATCH --mem=30G
#SBATCH --gres=gpu:1
#SBATCH --partition dgx-spa,dgx-common,gpu,gpushort
#SBATCH --constraint=volta

python src_joint/main.py parse \
    --dataset ptb \
    --save-per-sentences 1000 \
    --eval-batch-size 50 \
    --contributions 0 \
    --input-path ../exp/deprel-europarl/data/Europarl.en-fi.en \
    --output-path-synconst ../exp/deprel-europarl/data/Europarl.en-fi.en_synconst \
    --output-path-syndep ../exp/deprel-europarl/data/Europarl.en-fi.en_syndephead \
    --output-path-synlabel ../exp/deprel-europarl/data/Europarl.en-fi.en_syndeplabel \
    --embedding-path data/glove.gz \
    --model-path-base best_parser.pt
