python train_gnn.py --config config_resamp_4top_no.yaml -o 20220809_4top_resam_test --device 3 --epoch 50 --batch 1024 --lr 1e-3 --seed 12345 --weight 0 --fea 4 --cla 1 --model GNN1layer_re

python eval_gnn.py --config config_resamp_4top_no.yaml -o 20220809_4top_resam_test --device 3 --cla 1 --weight 0 --batch 1 --seed 12345 --fea 4
