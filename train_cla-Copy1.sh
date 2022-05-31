#!/bin/bash


# python train_4top_QCD_cla_resam.py --config config_4top_QCD_v2.yaml --epoch 200 --batch 1024 -o date202205026_abs_test --device 0 --cla 1 --model GNN3layer --fea 4 --lr 1e-4 --weight 1

# python eval_4top_QCD_cla.py --config config_4top_QCD_v2.yaml --batch 1 -o date202205026_abs_test --device 0 --cla 1 --weight 1


# python train_4top_QCD_cla_realweight.py --config config_4top_QCD.yaml --epoch 1000 --batch 1024 -o date20220512_real_run --device 0 --cla 1 --model GNN3layer --fea 4 --lr 1e-3

# python eval_4top_QCD_cla_resam.py --config config_4top_QCD.yaml --batch 1024 -o date20220512_real_run --device 0

python train_4top_QCD_cla_resam.py --config config_4top_QCD_v2.yaml --epoch 200 --batch 1024 -o date202205027_normal_test_1L --device 0 --cla 1 --model GNN1layer --fea 4 --lr 1e-4 --weight 0

python eval_4top_QCD_cla.py --config config_4top_QCD_v2.yaml --batch 1 -o date202205027_normal_test_1L --device 0 --cla 1 --weight 0


python train_4top_QCD_cla_resam.py --config config_4top_QCD_v2.yaml --epoch 200 --batch 1024 -o date202205027_neg_test_1L --device 0 --cla 1 --model GNN1layer --fea 4 --lr 1e-4 --weight 2

python eval_4top_QCD_cla.py --config config_4top_QCD_v2.yaml --batch 1 -o date202205027_neg_test_1L --device 0 --cla 1 --weight 2

python train_4top_QCD_cla_resam.py --config config_4top_QCD_v2.yaml --epoch 200 --batch 1024 -o date202205027_abs_test_1L --device 0 --cla 1 --model GNN1layer --fea 4 --lr 1e-4 --weight 1

python eval_4top_QCD_cla.py --config config_4top_QCD_v2.yaml --batch 1 -o date202205027_abs_test_1L --device 0 --cla 1 --weight 1
