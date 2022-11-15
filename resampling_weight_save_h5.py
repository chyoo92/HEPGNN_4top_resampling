#!/usr/bin/env python
# coding: utf-8

# In[1]:


import numpy as np
import uproot
import h5py
import os
import torch
import torch_geometric.nn as PyG
from torch_geometric.transforms import Distance
from torch_geometric.data import InMemoryDataset as PyGDataset, Data as PyGData
from torch_geometric.data import Data
import math
import numba
import numpy as np
import torch
import h5py
import torch.nn as nn
import torch.nn.functional as F
import torch_geometric.nn as PyG
from torch_geometric.transforms import Distance
from torch_geometric.data import DataLoader
from torch_geometric.data import Data as PyGData
from torch_geometric.data import Data
import sys, os
import subprocess
import csv, yaml
import math
from tqdm import tqdm
from sklearn.metrics import accuracy_score
import torch.optim as optim
import argparse
import pandas as pd
import matplotlib.pyplot as plt
import matplotlib.tri as tri
# import numpy, numba, awkward, awkward.numba


# In[2]:


fea = 3

path = '/users/yewzzang/data_graph/h5/4top/noedge/'
# out_path1 = '/users/yewzzang/data_graph/pt/ttbar_weight_210719/alledge_w1/'
out_path2 = '/users/yewzzang/data_graph/h5/4top/noedge_w2_r/'


# resampling_model_9s = '/users/yewzzang/work/HEPGNN_4top_resampling/result/date20220713_resampling_fea4_9s_ttbar_test1_alledge'
resampling_model_all = '/users/yewzzang/work/HEPGNN_4top_resampling/result/20220801_4top_resampling_fea3_no/'


# In[ ]:





# In[3]:


sys.path.append("./python")


# In[4]:


from model.allModel import *

# model_9s = torch.load(resampling_model_9s+'/model.pth', map_location='cpu')
# model_9s.load_state_dict(torch.load(resampling_model_9s+'/weight.pth', map_location='cpu'))
# model_9s = model_9s.cuda()
# device = 'cuda'

model_all = torch.load(resampling_model_all+'/model.pth', map_location='cpu')
model_all.load_state_dict(torch.load(resampling_model_all+'/weight.pth', map_location='cpu'))
model_all = model_all.cuda()
device = 'cuda'


# In[ ]:





# In[5]:


res = []
for root, dirs, files in os.walk(path):
    rootpath = os.path.join(os.path.abspath(path), root)
    for file in files:
        filepath = os.path.join(rootpath, file)
        
        filetype = filepath.split('.')[-1]
        if filetype != 'h5': continue
  
        res.append(filepath)


# In[6]:


res


# In[ ]:





# In[ ]:





# In[ ]:





# In[7]:


import time
start = time.time()
for i in range(len(res)):

    file_name = res[i]
    cla = file_name.split('/')[-4].split('_')
    num = file_name.split('/')[-1].split('.')[-2]

    

    save_f_name = num

    save_path2 = out_path2
    if not os.path.exists(save_path2): os.makedirs(save_path2)
    save_file_name2 = save_path2 + save_f_name + '.h5'
    
 
    
    
    ### load data
    try:
        r_data = h5py.File(file_name,'r')

    except KeyError:
        print("delphes 없음")
        pass
    

    model_all.eval()
    

    rs_w = []
    for i in tqdm(range(len(np.array(r_data['group']['fea']['fea'])))):
#     for i in range(5):
        
   
        data_1 = PyGData(x = torch.Tensor(np.array(r_data['group']['fea']['fea'])[i].reshape(-1,7)[:,:fea]), 
                         edge_index=torch.Tensor(np.array(r_data['group']['edge']['edge'])[i].reshape(2,-1)).type(dtype = torch.long), 
                         pos = torch.Tensor(np.array(r_data['group']['pos']['pos'])[i].reshape(-1,3)), 
                         y = np.int(np.array(r_data['group']['label']['label'])[i][0]), 
                         batch = torch.from_numpy(np.zeros([1],dtype = np.int)))
        data_1 = data_1.to(device)
        
        pred2 = model_all(data_1)
      
        
         
        rs_w.append(pred2[0].detach().to("cpu"))

      
        
      
    
    f = h5py.File(save_file_name2, mode='w')

    dt = h5py.special_dtype(vlen=np.dtype('float32'))
    g = f.create_group("group")
    
    pos = g.create_group("pos")
    x_fea = g.create_group("fea")
    edge_index = g.create_group("edge")
    label = g.create_group("label")
    rs_weight = g.create_group("resampling")
    
    pos.create_dataset('pos', (len(np.array(r_data['group']['fea']['fea'])),), dtype=dt)
    pos['pos'][...] = np.array(r_data['group']['pos']['pos'])
    x_fea.create_dataset('fea', (len(np.array(r_data['group']['fea']['fea'])),), dtype=dt)
    x_fea['fea'][...] = np.array(r_data['group']['fea']['fea'])
    edge_index.create_dataset('edge', (len(np.array(r_data['group']['fea']['fea'])),), dtype=dt)
    try:
        edge_index['edge'][...] = np.array(r_data['group']['edge']['edge'])
    except:
        edge_index['edge'][...] = np.array(r_data['group']['edge']['edge']).tolist()
    label.create_dataset('label', (len(np.array(r_data['group']['fea']['fea'])),), dtype=dt)
    label['label'][...] = np.array(r_data['group']['label']['label'])[0]
    
    rs_weight.create_dataset('resampling', (len(np.array(r_data['group']['fea']['fea'])),), dtype=dt)
    rs_weight['resampling'][...] = rs_w
 
    f.close()


print(time.time()-start)

