#!/bin/bash


python train_4top_resampling_lhe.py --config config_resampling.yaml --epoch 3000 --batch 4096 -o 20220520_all_data_resam --device 0 --cla 1 --model GCN3 --fea 4 --lr 1e-3 --color 0

python eval_4top_resampling_lhe.py --config config_resampling.yaml --batch 1 -o 20220520_all_data_resam --device 0 --color 0
