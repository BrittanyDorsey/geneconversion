# -*- coding: utf-8 -*-
"""
Created on Wed Jun  9 10:00:52 2021

@author: britt
"""

#import allel
import numpy as np
import pandas as pd
print("loaded packages")

#generate dictionary1 - alternative
array = np.loadtxt("alt_dict_run2.csv", dtype=str, delimiter=',')
homalt = array[:,0]
alt = array[:,1]
homalt_x = {int(homalt[i]): alt[i] for i in range(len(homalt))}
print("loaded dictionary1")

#generate dictionary2
array2 = np.loadtxt("reference_dict.csv", dtype=str, delimiter=',')
homref = array2[:,0]
ref = array2[:,1]
homref_x = {int(homref[i]): ref[i] for i in range(len(homref))}
print("loaded dictionary2")

#define positions on Y
#yset = allel.read_vcf('CombinedPop_y_nohetmiss.vcf')
#ypos = yset['variants/POS']

#load conversion
df = pd.read_csv("alignment_coordinates_circos_header.txt", delimiter=" ")
print("loaded conversion")

#try again with no heterozygous on Y but missing okay
#yset2 = allel.read_vcf('CombinedPop_y_nohet.vcf')
#ypos2 = yset2['variants/POS']
ypos2 = np.loadtxt("ypos2_removed3.txt", dtype=int)
print("loaded ypos2")

chro = 'Y'
results_y2 = []
results_x2 = []
for z in ypos2:
    pos = z
    for i in range(0, 3226):
        if chro == 'Y':
            a = 1
            b = 2
            c = 4
            d = 5
        elif chro == 'X':
            a = 4
            b = 5
            c = 1
            d = 2
        lower = df.iloc[i,a]
        upper = df.iloc[i,b]
        if upper < lower:
            lower = df.iloc[i,b]
            upper = df.iloc[i,a]
        #is_between = pos in range(lower, upper) #gives T/F
        if pos in range(lower, upper):
            results_y2.append(pos)
            diff = pos - df.iloc[i,a]
            new_pos = df.iloc[i,c] + diff
            results_x2.append(new_pos)
            #will sometimes map to multiple places
            
np.savetxt("results_y_run2.txt", results_y2, fmt='%.0f')
np.savetxt("results_x_run2.txt", results_x2, fmt='%.0f')
