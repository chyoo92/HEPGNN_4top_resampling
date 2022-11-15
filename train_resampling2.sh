#!/bin/bash

# python train_gnn.py --config config_resamp_ttbar_no.yaml -o 20220801_ttbar_resampling_fea3_no --device 0 --epoch 300 --batch 1024 --lr 1e-3 --seed 12345 --weight 0 --fea 3 --cla 1 --model GNN1layer_re

python eval_gnn.py --config config_resamp_ttbar_no.yaml -o 20220801_ttbar_resampling_fea3_no --device 0 --cla 1 --weight 0 --batch 1 --seed 12345 --fea 3

# python train_gnn.py --config config_resamp_ttbar_no.yaml -o 20220801_ttbar_resampling_fea4_no --device 0 --epoch 300 --batch 1024 --lr 1e-3 --seed 12345 --weight 0 --fea 4 --cla 1 --model GNN1layer_re

python eval_gnn.py --config config_resamp_ttbar_no.yaml -o 20220801_ttbar_resampling_fea4_no --device 0 --cla 1 --weight 0 --batch 1 --seed 12345 --fea 4

# python train_gnn.py --config config_resamp_ttbar_no.yaml -o 20220801_ttbar_resampling_fea5_no --device 0 --epoch 300 --batch 1024 --lr 1e-3 --seed 12345 --weight 0 --fea 5 --cla 1 --model GNN1layer_re

python eval_gnn.py --config config_resamp_ttbar_no.yaml -o 20220801_ttbar_resampling_fea5_no --device 0 --cla 1 --weight 0 --batch 1 --seed 12345 --fea 5

# python train_gnn.py --config config_resamp_ttbar_all.yaml -o 20220801_ttbar_resampling_fea3_all --device 0 --epoch 300 --batch 1024 --lr 1e-3 --seed 12345 --weight 0 --fea 3 --cla 1 --model GNN1layer_re

python eval_gnn.py --config config_resamp_ttbar_all.yaml -o 20220801_ttbar_resampling_fea3_all --device 0 --cla 1 --weight 0 --batch 1 --seed 12345 --fea 3

# python train_gnn.py --config config_resamp_ttbar_all.yaml -o 20220801_ttbar_resampling_fea4_all --device 0 --epoch 300 --batch 1024 --lr 1e-3 --seed 12345 --weight 0 --fea 4 --cla 1 --model GNN1layer_re

python eval_gnn.py --config config_resamp_ttbar_all.yaml -o 20220801_ttbar_resampling_fea4_all --device 0 --cla 1 --weight 0 --batch 1 --seed 12345 --fea 4

# python train_gnn.py --config config_resamp_ttbar_all.yaml -o 20220801_ttbar_resampling_fea5_all --device 0 --epoch 300 --batch 1024 --lr 1e-3 --seed 12345 --weight 0 --fea 5 --cla 1 --model GNN1layer_re

python eval_gnn.py --config config_resamp_ttbar_all.yaml -o 20220801_ttbar_resampling_fea5_all --device 0 --cla 1 --weight 0 --batch 1 --seed 12345 --fea 5
