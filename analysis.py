# -*- coding: utf-8 -*-
"""
Created on Wed Jun  9 15:28:40 2021

@author: britt
"""
#import allel
import numpy as np
import pandas as pd
import pickle

#load files
results_y_array = np.loadtxt("results_y_run2.txt")
results_y = list(results_y_array)
results_x_array = np.loadtxt("results_x_run2.txt")
results_x = list(results_x_array)


#generate dictionary1 - alternative
array = np.loadtxt("alt_dict_run2.csv", dtype=str, delimiter=',')
homalt = array[:,0]
alt = array[:,1]
homalt_x = {int(homalt[i]): alt[i] for i in range(len(homalt))}


#generate dictionary2
#array2 = np.loadtxt("reference_dict.csv", dtype=str, delimiter=',')
#homref = array2[:,0]
#ref = array2[:,1]
#homref_x = {int(homref[i]): ref[i] for i in range(len(homref))}
array2 = pd.read_csv("reference_dict.csv", header=None)
homref = array2.iloc[:,0]
ref = array2.iloc[:,1]
homref_x = {int(homref[i]): ref[i] for i in range(len(homref))}

array3 = np.loadtxt("new_dict_ref_x_alt.csv", dtype=str, delimiter=',')
p = array3[:,0]
r = array3[:,1]
ref_x_dic = {int(p[i]): r[i] for i in range(len(p))}


#initialize lists
y_position = []
x_position = []
x_allele_list = []
y_allele_list = []
match_list = []
match_type = []
lw_individuals = []
ps_individuals = []
filteredout = []
yref_list = []
xref_list = []

#define y we're working with
#yset = allel.read_vcf('CombinedPop_y_nohet.vcf')

#put it all together
'''
vars = []
variants = yset['variants/ALT']
for i in range(0,len(variants)):
    x = variants[i,0]
    vars.append(x)
'''
vars = np.loadtxt("new_vars_nohet_removed3.txt", dtype=str)
    
#gt = yset['calldata/GT']
pkl_file = open('new_gt_nohet_removed3.pkl', 'rb')
gt = pickle.load(pkl_file)
pkl_file.close()

yr = np.loadtxt("new_yref_nohet_removed3.txt", dtype=str)

for i in results_y:
    ind = results_y.index(i)
    #corresponding position on x
    cor = results_x[ind]
    if cor in homalt_x:
        type_match = 'homalt'
        x_allele = homalt_x[cor]
        y_allele = vars[ind]
        yref = yr[ind]
        xref = ref_x_dic[cor]
        if y_allele.lower() == x_allele.lower():
            match = 'Y'
            indi_lw = sum(gt[ind,0:19,0:2] == [1,1])
            indi_lw = indi_lw[0]
            indi_ps = sum(gt[ind,19:36,0:2] == [1,1])
            indi_ps = indi_ps[0]
        else:
            match = 'N'
            indi_lw = sum(gt[ind,0:19,0:2] == [1,1])
            indi_lw = indi_lw[0]
            indi_ps = sum(gt[ind,19:36,0:2] == [1,1])
            indi_ps = indi_ps[0]
        y_position.append(i)
        x_position.append(cor)
        x_allele_list.append(x_allele)
        xref_list.append(xref)
        y_allele_list.append(y_allele)
        yref_list.append(yref)
        match_list.append(match)
        match_type.append(type_match)
        lw_individuals.append(indi_lw)
        ps_individuals.append(indi_ps)
    #repeat for both dictionaries
    elif cor in homref_x:
        type_match = 'homref'
        x_allele = homref_x[cor]
        y_allele = vars[ind]
        yref = yr[ind]
        if y_allele.lower() == x_allele.lower():
            match = 'Y'
            indi_lw = sum(gt[ind,0:19,0:2] == [1,1])
            indi_lw = indi_lw[0]
            indi_ps = sum(gt[ind,19:36,0:2] == [1,1])
            indi_ps = indi_ps[0]
        else:
            match = 'N'
            indi_lw = sum(gt[ind,0:19,0:2] == [1,1])
            indi_lw = indi_lw[0]
            indi_ps = sum(gt[ind,19:36,0:2] == [1,1])
            indi_ps = indi_ps[0]
        y_position.append(i)
        x_position.append(cor)
        x_allele_list.append(x_allele)
        xref_list.append(x_allele)
        y_allele_list.append(y_allele)
        yref_list.append(yref)
        match_list.append(match)
        match_type.append(type_match)
        lw_individuals.append(indi_lw)
        ps_individuals.append(indi_ps)
    else:
        filteredout.append(cor)
        
dict = {'y_position': y_position, 'x_position': x_position, 'x_allele': x_allele_list, 'x_ref': xref_list, 'y_alt_allele': y_allele_list, 'y_ref': yref_list, 'match': match_list, 'match_type_x': match_type, 'lw_individuals': lw_individuals, 'ps_individuals': ps_individuals}   
df = pd.DataFrame(dict)
df.to_csv('fullinfo_results_pops.csv')
np.savetxt("filteredout_x_pops.txt", filteredout, fmt='%.0f')
