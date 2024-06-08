import pandas as pd
from scipy.stats import f_oneway

ko_table=pd.read_csv('Gene_KOs.tsv',sep='\t')

mut_table=pd.read_csv('Mutations.tsv',sep='\t')

#ko_table
#mut_table
mut_table.set_index('Mutation',inplace=True)
#genelist

genelist=ko_table.columns[1:]
#mutationlist
mutationlist=mut_table.index
allresults=[]
for gene in genelist:
    records=ko_table[gene].values
    for mutation in mutationlist:
        mutation_record=mut_table.loc[mutation,:].values
        
        #print(gene,mutation)
        
        #print(records.shape)
        #print(mutation_record.shape)
        res=f_oneway(mutation_record,records, axis=0)
        
        result='%s,%s,%s'%(gene,mutation,str(res))
        
        result=[gene,mutation,str(res)]
        allresults.append(result)
        #oneway(records,mutation_record)
        
        
df=pd.DataFrame(allresults,columns=['Gene','Mutation','Oneway'])
df.to_csv('oneway.csv',index=False)