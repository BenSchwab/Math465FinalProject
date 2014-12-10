#!/usr/bin/python
import os
path = os.getcwd()+'/mnist_figs/'
for filename in os.listdir(path):
    original = open(path+filename)
    outfileMerge = open(path+filename+'_merged','w')
    outfileUnmerge = open(path+filename+'_unmerged','w')
    Unmerged = True
    for line in original:
        if line[:6]=='merged':
            Unmerged = False
        if Unmerged == True:
            outfileUnmerge.write(line)
        else:
            outfileMerge.write(line)
    outfileMerge.close()
    outfileUnmerge.close()
    original.close()
