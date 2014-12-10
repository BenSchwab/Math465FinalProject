#!/usr/bin/python
import os
path = os.getcwd()+'/mnist_figs/'
newPath = path+'MergeUnMergeFiles/'
#os.mkdir(newPath+'Files_1000/')
for filename in os.listdir(newPath):
    if filename != 'MergeUnMergeFiles':
        if '1000' in filename and not filename.endswith('unmerged'):
            os.system('cp '+newPath+filename+' '+newPath+'Files_1000/'+filename)
#    if filename.endswith('merged'):
#        os.system('mv '+path+filename+' '+newPath+filename)

