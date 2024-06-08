// declare the params


params.genelistfile = "$projectDir/genelist.txt"
params.mutationlistfile="$projectDir/mutationlist.txt"
params.outfile="$projectDir/nextflow-output.tsv"
params.size = 5


log.info """\
    A N O V A - N F - P I P E L I N E
    ===================================
    gene list       : ${params.genelistfile}
    mutation list   : ${params.mutationlistfile}
    output file     : ${params.outfile}
    """
    .stripIndent()



// process 'create_output_file' generates all gene-mutation pair records/coordinates and saves as an output file (output.tsv)

process create_output_file { 
  tag 'Generated all gene-mutation pair coordinates...'

input:
val outfile
script:
"""
echo  "Gene\tMutation\tOneway" > $outfile 
"""

}

// process "anova_for_mutation_gene_pair" computes the scipy anova for each gene-mutation coordinates/records in the output file 

process anova_for_mutation_gene_pair {
  tag 'generating one-way anova for this gene-mutation pair cooridinate...'

  debug true
  input: 
  file x
  
  script:
  """
 
  python3 /python/mosaic_nextflow.py $x
  
  """
  
 }

workflow {
gene_ch=channel
    .fromPath(params.genelistfile)
    .splitText()
   
mutation_ch=channel
    .fromPath(params.mutationlistfile)
    .splitText()  
    

out_ch=Channel.of(params.outfile)
create_output_file(out_ch)

combi=gene_ch.combine(mutation_ch)
anova_for_mutation_gene_pair(combi)
    
}



//    Workflow Event Handler
workflow.onComplete {
   println ( workflow.success ? """
       Pipeline execution summary
       Completed at: ${workflow.complete}
       Duration    : ${workflow.duration}
       Success     : ${workflow.success}
       workDir     : ${workflow.workDir}
       exit status : ${workflow.exitStatus}
       """ : """
       Failed: ${workflow.errorReport}
       exit status : ${workflow.exitStatus}
       """
)
}
 
// The end


