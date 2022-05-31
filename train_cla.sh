#!/bin/bash
python train_4top_QCD_cla_resam.py --config config_4top_QCD_v2.yaml --epoch 200 --batch 1024 -o date202205027_normal_test_1L --device 0 --cla 1 --model GNN1layer --fea 4 --lr 1e-4 --weight 0

python eval_4top_QCD_cla.py --config config_4top_QCD_v2.yaml --batch 1 -o date202205027_normal_test_1L --device 0 --cla 1 --weight 0


python train_4top_QCD_cla_resam.py --config config_4top_QCD_v2.yaml --epoch 200 --batch 1024 -o date202205027_neg_test_1L --device 0 --cla 1 --model GNN1layer --fea 4 --lr 1e-4 --weight 2

python eval_4top_QCD_cla.py --config config_4top_QCD_v2.yaml --batch 1 -o date202205027_neg_test_1L --device 0 --cla 1 --weight 2

python train_4top_QCD_cla_resam.py --config config_4top_QCD_v2.yaml --epoch 200 --batch 1024 -o date202205027_abs_test_1L --device 0 --cla 1 --model GNN1layer --fea 4 --lr 1e-4 --weight 1

python eval_4top_QCD_cla.py --config config_4top_QCD_v2.yaml --batch 1 -o date202205027_abs_test_1L --device 0 --cla 1 --weight 1
