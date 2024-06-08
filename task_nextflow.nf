#!/usr/bin/env python3

import sys
import pandas as pd
import os
from scipy.stats import f_oneway

#print(sys.argv[1])
#print(sys.argv[2])

# get the imput gene and mutation files

geneinfofile="/python/Gene_KOs.tsv"
mutinfofile="/python/Mutations.tsv"
outfile="/python/nextflow-output.tsv"
with open(sys.argv[1],'r') as myinput:
    gene=myinput.readlines()[0].strip('\n')
    #print(gene)
   
with open(sys.argv[2],'r') as myinput:
    mutation=myinput.readlines()[0].strip('\n')
    #print(mutation)
   

ko_table=pd.read_csv(geneinfofile,sep='\t')

mut_table=pd.read_csv(mutinfofile,sep='\t')


mut_table.set_index('Mutation',inplace=True)
records=ko_table[gene].values
mutation_record=mut_table.loc[mutation,:].values

res=f_oneway(mutation_record,records, axis=0)
        
result='%s\t%s\t%s\n'%(gene,mutation,str(res))
        


with open(outfile,'a') as myoutput:
    myoutput.write(result)
    myoutput.close()