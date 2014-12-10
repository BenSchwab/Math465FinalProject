#!/usr/bin/python
import os
path = os.getcwd()+'/mnist_figs/'
newPath = path+'MergeUnMergeFiles/'
os.mkdir(newPath)
for filename in os.listdir(path):
    if filename.endswith('merged'):
        os.system('mv '+path+filename+' '+newPath+filename)

