#!/bin/bash


# # 
# python train_4top_QCD_w_resam.py --config config_4top_QCD.yaml --epoch 50 --batch 1024 -o date20220504_4top_QCD_cla_resam_run1 --device 0 --cla 1 --model GNN3layer --fea 4 --lr 1e-4


# python eval_4top_QCD_w_resam.py --config config_4top_QCD.yaml --batch 1 -o date20220504_4top_QCD_cla_resam_run1 --device 0



python train_4top_QCD_w_realweight.py --config config_4top_QCD.yaml --epoch 1000 --batch 1024 -o date20220512_real_run --device 0 --cla 1 --model GNN3layer --fea 4 --lr 1e-3

python eval_4top_QCD_w_resam.py --config config_4top_QCD.yaml --batch 1024 -o date20220512_real_run --device 0




# python train_4top_QCD_w_resam.py --config config_4top_QCD_test.yaml --epoch 100 --batch 1024 -o date20220503_test1 --device 2 --cla 1 --model GNN3layer --fea 4 --lr 1e-4

# python eval_4top_QCD_w_resam.py --config config_4top_QCD_test.yaml --batch 1024 -o date20220503_test1 --device 2
