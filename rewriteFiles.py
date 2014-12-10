#!/usr/bin/python
import os
path = os.getcwd()+'/mnist_figs/'
NewPath = path+'MergeUnMergeFiles/'
for filename in os.listdir(path):
    if filename != 'MergeUnMergeFiles':
        original = open(path+filename)
        outfileMerge = open(NewPath+filename+'_merged','w')
        outfileUnmerge = open(NewPath+filename+'_unmerged','w')
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
