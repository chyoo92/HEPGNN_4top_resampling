#!/bin/bash

#### edge 0 / activation soft 0 / Ly 2
for i in {0..2}
do
    for j in {0..4}
    do
        python train_4top_resampling_lhe.py --config config_resampling.yaml --epoch 3000 --batch 4096 -o date20220531_edge${i}_acti${j}_ly2 --device 0 --cla 1 --model GCN2 --fea 4 --lr 1e-3 --edge ${i} --activation ${j}

    python eval_4top_resampling_lhe.py --config config_resampling_eval.yaml --batch 1 -o date20220531_edge${i}_acti${j}_ly2 --device 0 --edge ${i} --cla 1


    done
done


