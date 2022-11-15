#!/bin/bash 

# python train_gnn.py --config config_4top_QCD_w2_all.yaml -o 20220819_4top_QCD_3fea_all_2L_w2 --device 3 --epoch 200 --batch 1024 --lr 1e-3 --seed 12345 --weight 1 --fea 3 --cla 1 --model GNN2layer

# python eval_gnn.py --config config_4top_QCD_w2_all.yaml -o 20220819_4top_QCD_3fea_all_2L_w2 --device 3 --cla 1 --weight 1 --batch 1 --seed 12345 --fea 3


# python train_gnn.py --config config_4top_QCD_w2_all.yaml -o 20220819_4top_QCD_4fea_all_2L_w2 --device 3 --epoch 200 --batch 1024 --lr 1e-3 --seed 12345 --weight 1 --fea 4 --cla 1 --model GNN2layer

# python eval_gnn.py --config config_4top_QCD_w2_all.yaml -o 20220819_4top_QCD_4fea_all_2L_w2 --device 3 --cla 1 --weight 1 --batch 1 --seed 12345 --fea 4


# python train_gnn.py --config config_4top_QCD_w2_all.yaml -o 20220819_4top_QCD_5fea_all_2L_w2 --device 3 --epoch 200 --batch 1024 --lr 1e-3 --seed 12345 --weight 1 --fea 5 --cla 1 --model GNN2layer

# python eval_gnn.py --config config_4top_QCD_w2_all.yaml -o 20220819_4top_QCD_5fea_all_2L_w2 --device 3 --cla 1 --weight 1 --batch 1 --seed 12345 --fea 5


# python train_gnn.py --config config_4top_QCD_w2_all.yaml -o 20220819_4top_QCD_3fea_all_3L_w2 --device 3 --epoch 200 --batch 1024 --lr 1e-3 --seed 12345 --weight 1 --fea 3 --cla 1 --model GNN3layer

# python eval_gnn.py --config config_4top_QCD_w2_all.yaml -o 20220819_4top_QCD_3fea_all_3L_w2 --device 3 --cla 1 --weight 1 --batch 1 --seed 12345 --fea 3


# python train_gnn.py --config config_4top_QCD_w2_all.yaml -o 20220819_4top_QCD_4fea_all_3L_w2 --device 3 --epoch 200 --batch 1024 --lr 1e-3 --seed 12345 --weight 1 --fea 4 --cla 1 --model GNN3layer

# python eval_gnn.py --config config_4top_QCD_w2_all.yaml -o 20220819_4top_QCD_4fea_all_3L_w2 --device 3 --cla 1 --weight 1 --batch 1 --seed 12345 --fea 4


# python train_gnn.py --config config_4top_QCD_w2_all.yaml -o 20220819_4top_QCD_5fea_all_3L_w2 --device 3 --epoch 200 --batch 1024 --lr 1e-3 --seed 12345 --weight 1 --fea 5 --cla 1 --model GNN3layer

# python eval_gnn.py --config config_4top_QCD_w2_all.yaml -o 20220819_4top_QCD_5fea_all_3L_w2 --device 3 --cla 1 --weight 1 --batch 1 --seed 12345 --fea 5


python train_gnn.py --config config_4top_ttbar_w2_all.yaml -o 20220819_4top_ttbar_4fea_all_3L_w2 --device 2 --epoch 200 --batch 1024 --lr 1e-3 --seed 12345 --weight 1 --fea 4 --cla 1 --model GNN3layer

python eval_gnn.py --config config_4top_ttbar_w2_all.yaml -o 20220819_4top_ttbar_4fea_all_3L_w2 --device 2 --cla 1 --weight 1 --batch 1 --seed 12345 --fea 4



python train_gnn.py --config config_4top_ttbar_w2_all.yaml -o 20220819_4top_ttbar_5fea_all_3L_w2 --device 2 --epoch 200 --batch 1024 --lr 1e-3 --seed 12345 --weight 1 --fea 5 --cla 1 --model GNN3layer

python eval_gnn.py --config config_4top_ttbar_w2_all.yaml -o 20220819_4top_ttbar_5fea_all_3L_w2 --device 2 --cla 1 --weight 1 --batch 1 --seed 12345 --fea 5
