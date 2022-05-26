#!/bin/bash


python train_4top_QCD_cla_resam.py --config config_4top_QCD_v2.yaml --epoch 200 --batch 1024 -o date202205026_neg_test --device 0 --cla 1 --model GNN3layer --fea 4 --lr 1e-4 --weight 2

python eval_4top_QCD_cla_resam.py --config config_4top_QCD_v2.yaml --batch 1 -o date202205026_neg_test --device 2 --cla 1 --weight 2


# python train_4top_QCD_cla_realweight.py --config config_4top_QCD.yaml --epoch 1000 --batch 1024 -o date20220512_real_run --device 0 --cla 1 --model GNN3layer --fea 4 --lr 1e-3

# python eval_4top_QCD_cla_resam.py --config config_4top_QCD.yaml --batch 1024 -o date20220512_real_run --device 0
