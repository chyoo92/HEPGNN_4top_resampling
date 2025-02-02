#!/usr/bin/env python
# coding: utf-8
# %%
import h5py
import torch
from torch.utils.data import Dataset
import pandas as pd
from torch_geometric.data import InMemoryDataset as PyGDataset, Data as PyGData
from bisect import bisect_right
from glob import glob
import numpy as np
import math



   
        
class HEPGNNDataset_pt_classify_fourfeature_v6_h5(PyGDataset):
    def __init__(self, **kwargs):
        super(HEPGNNDataset_pt_classify_fourfeature_v6_h5, self).__init__(None, transform=None, pre_transform=None)
        self.isLoaded = False

        self.fNames = []
        self.sampleInfo = pd.DataFrame(columns=["procName", "fileName", "weight", "label", "fileIdx","sumweight"])

    def len(self):
        return int(self.maxEventsList[-1])

    def get(self, idx):
        if not self.isLoaded: self.initialize()

        fileIdx = bisect_right(self.maxEventsList, idx)-1

        offset = self.maxEventsList[fileIdx]
        idx = int(idx - offset)

        
   
        
        label = self.labelList[fileIdx][idx]
        weight = self.weightList[fileIdx][idx]
        real_weight = self.real_weightList[fileIdx][idx]
        btag = self.btag_List[fileIdx][idx]
        rescale = self.rescaleList[fileIdx][idx]
        procIdxs = self.procList[fileIdx][idx]
        
        eval_resam = self.eval_resamwList[fileIdx][idx]
        eval_real = self.eval_realwList[fileIdx][idx]
        
        feats = torch.Tensor(self.feaList[fileIdx][idx])
        poses = torch.Tensor(self.posList[fileIdx][idx])
        edges = torch.Tensor(self.edgeList[fileIdx][idx])
        edges = edges.type(dtype = torch.long)
        
        data = PyGData(x = feats, pos = poses, edge_index = edges)
        
        data.es = eval_resam.item()
        data.er = eval_real.item()
        data.bb = btag.item()
        data.rw = real_weight.item()
        data.ww = weight.item()

        data.y = label
        
        data.ss = rescale.item()
        data.rs = []
       
        return data
    def addSample(self, procName, fNamePattern, weight=1, logger=None):
        if logger: logger.update(annotation='Add sample %s <= %s' % (procName, fNames))
        print(procName, fNamePattern)

        for fName in glob(fNamePattern):
            if not fName.endswith(".h5"): continue
            fileIdx = len(self.fNames)
            self.fNames.append(fName)

            info = {
                'procName':procName, 'weight':weight, 'nEvent':0,
                'label':0, ## default label, to be filled later
                'fileName':fName, 'fileIdx':fileIdx, 'sumweight':0,
            }
            self.sampleInfo = self.sampleInfo.append(info, ignore_index=True)




    def setProcessLabel(self, procName, label):
        self.sampleInfo.loc[self.sampleInfo.procName==procName, 'label'] = label
    def initialize(self):
        if self.isLoaded: return

        print(self.sampleInfo)
        procNames = list(self.sampleInfo['procName'].unique())


        self.graphList = []
        self.labelList = []
        self.weightList = []
        self.rescaleList = []
        self.procList = []
        self.real_weightList = []
        self.btag_List = []
        
        self.eval_resamwList = []
        self.eval_realwList = []
        
        self.posList = []
        self.feaList = []
        self.edgeList = []
    
        
    
        
        
        nFiles = len(self.sampleInfo)
        ## Load event contents
        for i, fName in enumerate(self.sampleInfo['fileName']):
#             print("Loading files... (%d/%d) %s" % (i+1,nFiles,fName), end='\r')
            f = h5py.File(fName, 'r', libver='latest', swmr=True)['group']
#             f = torch.load(fName)
            
            nEvent = len(f['pos'].get('pos'))
#             nEvent = len(f)
             
            self.sampleInfo.loc[i, 'nEvent'] = nEvent

            
                
            label = self.sampleInfo['label'][i]
            labels = torch.ones(nEvent, dtype=torch.int32, requires_grad=False)*label
            self.labelList.append(labels)
            
            weight = self.sampleInfo['weight'][i]
            
            f_pos = f['pos'].get('pos')
            f_fea = f['fea'].get('fea')
            f_edge = f['edge'].get('edge')
     

            if 'resampling' in f.keys():
            
                f_rs = f['resampling'].get('resampling')
            
    
    
    
    
            graphlist = []
            weightlist = []
            weightslist = 0
            
            real_weightlist = []
            real_weightslist = 0
            
            eval_resamw = []
            eval_realw = []
            
            btag_list = []
            f_pos_list = []
            f_fea_list = []
            f_edge_list = []

            for j in range(nEvent):
                f_pos_reshape = f_pos[j].reshape(-1,3)
                f_fea_reshape = f_fea[j].reshape(-1,7)
                f_edge_reshape = f_edge[j].reshape(2,-1)
                if 'resampling' in f.keys():
                    
                    weights = f_rs[0][j] 
                
                else:
                    weights = f_fea_reshape[:,6][0]/np.abs(f_fea_reshape[:,6][0]) 
             
                
                btag_list.append(f_fea_reshape[:,4][0])
                
                if len(f_fea_reshape[0]) == 8:
                    real_weights = f_fea_reshape[:,7][0]/np.abs(f_fea_reshape[:,7][0]) 
                else:
                    real_weights = f_fea_reshape[:,6][0]/np.abs(f_fea_reshape[:,6][0])  
                eval_resamw.append(weights)
                eval_realw.append(real_weights)
                
                
           
                
                ### weights = w_ik
                ### weight = sigma_k / M_k
             
                weightlist.append(weights*weight)  
                weightslist = weightslist + weights
                
                real_weightlist.append(real_weights*weight)
                real_weightslist = real_weightslist + real_weights
                
                f_pos_list.append(f_pos_reshape)
                f_fea_list.append(f_fea_reshape[:,:4])
                f_edge_list.append(f_edge_reshape)
            
            
            
            sumw = weightslist
#             print(sumw, 'sumw')
            self.sampleInfo.loc[i, 'sumweight'] = sumw
            self.btag_List.append(btag_list)
            self.eval_resamwList.append(eval_resamw)
            self.eval_realwList.append(eval_realw)
            self.real_weightList.append(real_weightlist)
            self.weightList.append(weightlist)
            self.posList.append(f_pos_list)
            self.feaList.append(f_fea_list)
            self.edgeList.append(f_edge_list)
            
            
            self.rescaleList.append(torch.ones(nEvent, dtype=torch.float32, requires_grad=False))
            procIdx = procNames.index(self.sampleInfo['procName'][i])
            self.procList.append(torch.ones(nEvent, dtype=torch.int32, requires_grad=False)*procIdx)
        print("")
        
        ## Compute cumulative sums of nEvent, to be used for the file indexing
        self.maxEventsList = np.concatenate(([0.], np.cumsum(self.sampleInfo['nEvent'])))

        print('---------')
        ## Compute sum of weights for each label categories
        sumWByLabel = {}
        sumEByLabel = {}
        for label in self.sampleInfo['label']:
            label = int(label)
            ### w = sigma_k / M_k
            w = self.sampleInfo[self.sampleInfo.label==label]['weight']
            ### e = n_k
            e = self.sampleInfo[self.sampleInfo.label==label]['nEvent']
            ### sw = m_k
            sw = self.sampleInfo[self.sampleInfo.label==label]['sumweight']
            ### sumWByLabel = sum_k[(sigma_k/M_k)*m_k]
            sumWByLabel[label] = (w*sw).sum()
            ### sumEByLabel = sum(n_k)
            sumEByLabel[label] = e.sum()


        
        ### maxSumELabel -> signal sum(n_k)
        maxSumELabel = max(sumEByLabel, key=lambda key: sumEByLabel[key])
  
        ## Find rescale factors - make average weight to be 1 for each cat in the training step
        for fileIdx in self.sampleInfo['fileIdx']:
            label = self.sampleInfo.loc[self.sampleInfo.fileIdx==fileIdx, 'label']
   
            for l in label: ## this loop runs only once, by construction.
  
                ### rescale ---> 
                ### [(1/sumWByLabel)*sumEByLabel]*[maxSumELabel/sumEByLabel]
                self.rescaleList[fileIdx] *= ((1/sumWByLabel[l])*sumEByLabel[l])*(sumEByLabel[maxSumELabel]/sumEByLabel[l])

                break ## this loop runs only once, by construction. this break is just for a confirmation
                print('-'*80)
        for label in sumWByLabel.keys():
            print("Label=%d sumE=%d, sumW=%g" % (label, sumEByLabel[label], sumWByLabel[label]))
            

       
        print('-'*80)
        self.isLoaded = True
