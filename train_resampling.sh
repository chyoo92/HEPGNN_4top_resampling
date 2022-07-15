#!/bin/bash

python train_4top_resampling_lhe.py --config config_resamp_jet2_imsi.yaml --epoch 300 --batch 1024 -o date20220711_resampling_fea4_9s_ttbar_test1 --device 0 --cla 1 --model GNN1layer_re --fea 4 --lr 1e-3

python eval_4top_resampling_lhe.py --config config_resamp_jet2_imsi.yaml --batch 1 -o date20220711_resampling_fea4_9s_ttbar_test1 --device 0 --cla 1



python train_4top_resampling_lhe.py --config config_resamp_jet2.yaml --epoch 300 --batch 1024 -o date20220713_resampling_fea4_9s_ttbar_test1_alledge --device 0 --cla 1 --model GNN1layer_re --fea 4 --lr 1e-3

python eval_4top_resampling_lhe.py --config config_resamp_jet2.yaml --batch 1 -o date20220713_resampling_fea4_9s_ttbar_test1_alledge --device 0 --cla 1



python train_4top_resampling_lhe.py --config config_resamp_jet.yaml --epoch 300 --batch 1024 -o date20220713_resampling_fea4_all_ttbar_test1_alledge --device 0 --cla 1 --model GNN1layer_re --fea 4 --lr 1e-3

python eval_4top_resampling_lhe.py --config config_resamp_jet.yaml --batch 1 -o date20220713_resampling_fea4_all_ttbar_test1_alledge --device 0 --cla 1

