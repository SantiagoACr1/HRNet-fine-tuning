#!/usr/bin/env bash


export CUDA_VISIBLE_DEVICES=0
NUM_GPUS=1
export PYTHONPATH=$PYTHONPATH:`pwd`

config_path='baseline.hrnetw32'
model_dir='./log/normal_baseline/hrnetw32'

python train.py \
    --config_path=${config_path} \
    --model_dir=${model_dir} \
    train.eval_interval_epoch 5