## file 1 of 3: pmat.py

# Author: Angus Galloway, March 2015

# purpose: convert matlab binary eeg.mat data into .txt as columns for loadtxt.m 
# Assumes: USB20FD connected with eeg data from https://www.kaggle.com/c/seizure-prediction/data
# Notes: 'channels' is an m = 239766 by n = 16 matrix
# provided by loadtxt.m which has been put in another
# script to facilitate debugging

# pmat.py - parse .mat file of eeg data and convert each channel into a column

import scipy.io as sio
import numpy as np

fileName = 'Dog_1_test_segment_0020.mat'
structName = 'test_segment_20'

mat = sio.loadmat('../../../media/angus/USB20FD/Dog_1/' + fileName, struct_as_record=True)
filevars = sio.whosmat('../../../media/angus/USB20FD/Dog_1/' + fileName)
print(filevars);
#repr(mat);

C = mat[structName][0,0]['channels']
c = 'The shape of channel is ' + repr(C.shape);
#print c

D = mat[structName][0,0]['data']
d = 'The shape of data is ' + repr(D.shape);
print d

#print  mat['test_segment_20'][0,0]['data'][1,0]
#print D[0,0]		#0th channel, sample 0
#print D[15,239765]	#16th channel, last sample

fmt='%1.2e' # use exponential notation
np.savetxt('data/pmat.txt', np.transpose(D), fmt )   

