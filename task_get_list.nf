// define the params

params.genes="$projectDir/Gene_KOs.tsv"
params.mutations="$projectDir/Mutations.tsv"
params.outdir= "$projectDir"
params.x = '$i'
params.y = '$1'

log.info """\
    M U T A T I O N / G E N E - S P L I T - N F - P I P E L I N E
    ==========================================================
    gene file       : ${params.genes}
    mutation file   : ${params.mutations}
    output dirctory : ${params.outdir}
    """
    .stripIndent()


// generating gene list
process get_gene_list {
publishDir ("${params.outdir}", mode: 'copy')

tag 'Got gene list from Gene_KOs.tsv file'
input: 
val x
path gene
val x

output:
path ("genelist.txt")

script:
"""
awk -v n=2 '{ for (i=n; i<=NF; i++) printf "%s%s", $x,\
(i<NF ? OFS : ORS)}' $gene | head -n +1 | awk ' \
{ for(i=1;i<=NF;i++) { print $x }} ' > genelist.txt

"""

}


// generating mutation list
process get_mutation_list {
publishDir ("${params.outdir}", mode: 'copy')

tag 'Got mutation list from Mutation.tsv file'
input:

val y
path mutation
output:
path ("mutationlist.txt")

script:
"""
awk '{print $y}' $mutation | tail -n +2 > mutationlist.txt

"""

}

workflow {
    
    get_gene_list (params.x, params.genes, params.x)
    get_mutation_list (params.y, params.mutations)

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
