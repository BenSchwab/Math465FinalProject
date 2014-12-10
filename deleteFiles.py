#!/usr/bin/python
import os
path = os.getcwd()+'/mnist_figs/'
for filename in os.listdir(path):
    if filename.endswith('merged'):
        os.system('rm '+path+filename)
