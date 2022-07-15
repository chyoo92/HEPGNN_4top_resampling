#!/bin/bash

####### 4top no L1


python train_4top_QCD_cla_resam.py --config config_4top_QCD_w1_no.yaml --epoch 200 --batch 1024 -o date20220714_4top_cla_noedge_w1_L1 --device 3 --cla 1 --model GNN1layer --fea 4 --lr 1e-3 --weight 4

python eval_4top_QCD_cla_Btag.py --config config_4top_QCD_w1_no.yaml --batch 1 -o date20220714_4top_cla_noedge_w1_L1 --device 3 --cla 1 --weight 4


python train_4top_QCD_cla_resam.py --config config_4top_QCD_w2_no.yaml --epoch 200 --batch 1024 -o date20220714_4top_cla_noedge_w2_L1 --device 3 --cla 1 --model GNN1layer --fea 4 --lr 1e-3 --weight 4

python eval_4top_QCD_cla_Btag.py --config config_4top_QCD_w2_no.yaml --batch 1 -o date20220714_4top_cla_noedge_w2_L1 --device 3 --cla 1 --weight 4



####### 4top all L1


python train_4top_QCD_cla_resam.py --config config_4top_QCD_w1_all.yaml --epoch 200 --batch 1024 -o date20220714_4top_cla_alledge_w1_L1 --device 3 --cla 1 --model GNN1layer --fea 4 --lr 1e-3 --weight 4

python eval_4top_QCD_cla_Btag.py --config config_4top_QCD_w1_all.yaml --batch 1 -o date20220714_4top_cla_alledge_w1_L1 --device 3 --cla 1 --weight 4


python train_4top_QCD_cla_resam.py --config config_4top_QCD_w2_all.yaml --epoch 200 --batch 1024 -o date20220714_4top_cla_alledge_w2_L1 --device 3 --cla 1 --model GNN1layer --fea 4 --lr 1e-3 --weight 4

python eval_4top_QCD_cla_Btag.py --config config_4top_QCD_w2_all.yaml --batch 1 -o date20220714_4top_cla_alledge_w2_L1 --device 3 --cla 1 --weight 4

####### 4top no L2

python train_4top_QCD_cla_resam.py --config config_4top_QCD_w1_no.yaml --epoch 200 --batch 1024 -o date20220714_4top_cla_noedge_w1_L2 --device 3 --cla 1 --model GNN2layer --fea 4 --lr 1e-3 --weight 4

python eval_4top_QCD_cla_Btag.py --config config_4top_QCD_w1_no.yaml --batch 1 -o date20220714_4top_cla_noedge_w1_L2 --device 3 --cla 1 --weight 4



python train_4top_QCD_cla_resam.py --config config_4top_QCD_w2_no.yaml --epoch 200 --batch 1024 -o date20220714_4top_cla_noedge_w2_L2 --device 3 --cla 1 --model GNN2layer --fea 4 --lr 1e-3 --weight 4

python eval_4top_QCD_cla_Btag.py --config config_4top_QCD_w2_no.yaml --batch 1 -o date20220714_4top_cla_noedge_w2_L2 --device 3 --cla 1 --weight 4





####### 4top all L2

python train_4top_QCD_cla_resam.py --config config_4top_QCD_w1_all.yaml --epoch 200 --batch 1024 -o date20220714_4top_cla_alledge_w1_L2 --device 3 --cla 1 --model GNN2layer --fea 4 --lr 1e-3 --weight 4

python eval_4top_QCD_cla_Btag.py --config config_4top_QCD_w1_all.yaml --batch 1 -o date20220714_4top_cla_alledge_w1_L2 --device 3 --cla 1 --weight 4



python train_4top_QCD_cla_resam.py --config config_4top_QCD_w2_all.yaml --epoch 200 --batch 1024 -o date20220714_4top_cla_alledge_w2_L2 --device 3 --cla 1 --model GNN2layer --fea 4 --lr 1e-3 --weight 4

python eval_4top_QCD_cla_Btag.py --config config_4top_QCD_w2_all.yaml --batch 1 -o date20220714_4top_cla_alledge_w2_L2 --device 3 --cla 1 --weight 4




########ttbar real weight

python train_4top_QCD_cla_resam.py --config config_4top_QCD_v2_no.yaml --epoch 200 --batch 1024 -o date20220713_ttbar_cla_noedge_1L --device 3 --cla 1 --model GNN1layer --fea 4 --lr 1e-3 --weight 3

python eval_4top_QCD_cla_Btag.py --config config_4top_QCD_v2_no.yaml --batch 1 -o date20220713_ttbar_cla_noedge_1L --device 3 --cla 1 --weight 3

python train_4top_QCD_cla_resam.py --config config_4top_QCD_v2_no.yaml --epoch 200 --batch 1024 -o date20220713_ttbar_cla_noedge_2L --device 3 --cla 1 --model GNN2layer --fea 4 --lr 1e-3 --weight 3

python eval_4top_QCD_cla_Btag.py --config config_4top_QCD_v2_no.yaml --batch 1 -o date20220713_ttbar_cla_noedge_2L --device 3 --cla 1 --weight 3


python train_4top_QCD_cla_resam.py --config config_4top_QCD_v2_all.yaml --epoch 200 --batch 1024 -o date20220713_ttbar_cla_alledge_1L --device 3 --cla 1 --model GNN1layer --fea 4 --lr 1e-3 --weight 3

python eval_4top_QCD_cla_Btag.py --config config_4top_QCD_v2_all.yaml --batch 1 -o date20220713_ttbar_cla_alledge_1L --device 3 --cla 1 --weight 3

python train_4top_QCD_cla_resam.py --config config_4top_QCD_v2_all.yaml --epoch 200 --batch 1024 -o date20220713_ttbar_cla_alledge_2L --device 3 --cla 1 --model GNN2layer --fea 4 --lr 1e-3 --weight 3

python eval_4top_QCD_cla_Btag.py --config config_4top_QCD_v2_all.yaml --batch 1 -o date20220713_ttbar_cla_alledge_2L --device 3 --cla 1 --weight 3





# python train_4top_QCD_cla_resam.py --config config_4top_QCD_w1.yaml --epoch 200 --batch 1024 -o date20220705_4top_cla_alledge_w1_L1 --device 0 --cla 1 --model GNN1layer --fea 4 --lr 1e-3 --weight 4

# python eval_4top_QCD_cla.py --config config_4top_QCD_w1.yaml --batch 1 -o date20220705_4top_cla_alledge_w1_L1 --device 0 --cla 1 --weight 4


# python train_4top_QCD_cla_resam.py --config config_4top_QCD_w2.yaml --epoch 200 --batch 1024 -o date20220705_4top_cla_alledge_w2_L1 --device 0 --cla 1 --model GNN1layer --fea 4 --lr 1e-3 --weight 4

# python eval_4top_QCD_cla.py --config config_4top_QCD_w2.yaml --batch 1 -o date20220705_4top_cla_alledge_w2_L1 --device 0 --cla 1 --weight 4



# python train_4top_QCD_cla_resam.py --config config_4top_QCD_w1.yaml --epoch 200 --batch 1024 -o date20220705_4top_cla_alledge_w1_L2 --device 0 --cla 1 --model GNN2layer --fea 4 --lr 1e-3 --weight 4

# python eval_4top_QCD_cla.py --config config_4top_QCD_w1.yaml --batch 1 -o date20220705_4top_cla_alledge_w1_L2 --device 0 --cla 1 --weight 4



# python train_4top_QCD_cla_resam.py --config config_4top_QCD_w2.yaml --epoch 200 --batch 1024 -o date20220705_4top_cla_alledge_w2_L2 --device 0 --cla 1 --model GNN2layer --fea 4 --lr 1e-3 --weight 4

# python eval_4top_QCD_cla.py --config config_4top_QCD_w2.yaml --batch 1 -o date20220705_4top_cla_alledge_w2_L2 --device 0 --cla 1 --weight 4
