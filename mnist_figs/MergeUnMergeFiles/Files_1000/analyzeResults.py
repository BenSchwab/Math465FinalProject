#!/usr/bin/python
import os
path = os.getcwd()
zeroOneFileList1 = []
oneSevenFileList1 = []
zeroSixFileList1 = []
AllFileList1 = []
zeroOneFileList2 = []
oneSevenFileList2 = []
zeroSixFileList2 = []
AllFileList2 = []
for filename in os.listdir(path):
    if filename.endswith('merged'):
        if filename.startswith('zero_one_1000_2'):
            zeroOneFileList1.append(filename)
        elif filename.startswith('zero_one_1000_3'):
            zeroOneFileList2.append(filename)
        elif filename.startswith('one_seven_1000_2'):
            oneSevenFileList1.append(filename)
        elif filename.startswith('one_seven_1000_3'):
            oneSevenFileList2.append(filename)
        elif filename.startswith('zero_six_1000_4'):
            zeroSixFileList1.append(filename)
        elif filename.startswith('zero_six_1000_7'):
            zeroSixFileList2.append(filename)
        elif filename.startswith('all_1000_10'):
            AllFileList1.append(filename)
        elif filename.startswith('all_1000_20'):
            AllFileList2.append(filename)            
        else:
            print 'Error: '+filename
AnalyzeList = [(zeroOneFileList1,2,'zeroOne'),(oneSevenFileList1,2,'oneSeven'),(zeroSixFileList1,4,'zeroSix'),(AllFileList1,10,'All')]
AnalyzeList2 = [(zeroOneFileList2,3,'zeroOne'),(oneSevenFileList2,3,'oneSeven'),(zeroSixFileList2,7,'zeroSix'),(AllFileList2,20,'All')]
ResultsDict = {}
for dataSet in AnalyzeList:
    fileList = dataSet[0]
    fileType = dataSet[2]
    numCluster = dataSet[1]
    max = 0
    maxfile=''
    for f in fileList:
        fileopen = open(f)
        score = 0
        for line in fileopen:
            if line[:6]!='merged':
                l = line.split()
                score += float(l[0])*float(l[2])
                if l[0]=='NaN':
                    score = 0
        if score > max:
            max = score
            maxfile = f
    ResultsDict[fileType] = (max,maxfile)
    os.system('echo '+fileType)
    os.system('echo '+ResultsDict[fileType][1])
    os.system('cat '+ResultsDict[fileType][1])
    os.system('echo')
ResultsDict2 = {}
for dataSet in AnalyzeList2:
    fileList = dataSet[0]
    fileType = dataSet[2]
    numCluster = dataSet[1]
    max = 0
    maxfile=''
    for f in fileList:
        fileopen = open(f)
        score = 0
        for line in fileopen:
            if line[:6]!='merged':
                l = line.split()
                score += float(l[0])*float(l[2])
                if l[0]=='NaN':
                    score = 0
        if score > max:
            max = score
            maxfile = f
    ResultsDict2[fileType] = (max,maxfile)
    os.system('echo '+fileType)
    os.system('echo '+ResultsDict2[fileType][1])
    os.system('cat '+ResultsDict2[fileType][1])
    os.system("echo")
