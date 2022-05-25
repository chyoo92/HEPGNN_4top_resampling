#!/bin/bash


python train_4top_resampling_lhe.py --config config_trn.yaml --epoch 20000 --batch 64 -o 20220428_4top_run1_color --device 3 --cla 1 --model GCN3 --fea 4 --lr 1e-3 --color 1

python eval_4top_resampling_lhe.py --config config_eval.yaml --batch 1 -o 20220428_4top_run1_color --device 3 --color 1
