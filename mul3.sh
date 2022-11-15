#!/bin/bash


python train_gnn_mul.py --config config_mul_w2_all_f5.yaml -o 20220819_mul_fea3_all_re_1 --device 0 --epoch 200 --batch 1024 --lr 1e-3 --seed 12345 --weight 1 --fea 3 --cla 3 --model GNN1layer_mul

python eval_gnn_formul.py --config config_mul_w2_all_f5.yaml -o 20220819_mul_fea3_all_re_1 --device 0 --cla 3 --weight 1 --batch 1 --seed 12345 --fea 3
