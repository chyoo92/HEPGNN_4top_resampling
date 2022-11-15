#!/bin/bash

python train_4top_resampling_lhe.py --config config_resamp_jet2.yaml --epoch 300 --batch 1024 -o memory_test1 --device 0 --cla 1 --model GNN1layer_re --fea 4 --lr 1e-3

