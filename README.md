#This is a technical test as part of screening processes for the position of Bioinformatician @ Mosaic Therapeutics
 
Name of candidate: Samson Olofinsae 
Contact: olofinsae.samson@gmail.com
Code compilation date: 02/10/2023

# Scripts
- Dockerfile              # Dockerfile for building image
- test_musaic.py          # file for unit testing
- mosaic.py               # python script for running one-way anova on the .tsv files
- Gene_KOs.tsv 
- Mutations.tsv
- anova_docker_run.sh     # executable script for building image and deploying it into an interactive container. 
  Can be run with ./anova_docker_run.sh on the terminal
- README.md               # contains installation instructions
- mosaic_get_lists.nf     # Nextflow script that splits files by gene and mutation and make a list of each 
- mosaic_get_anova.nf     # Nextflow script that computes one-way anova for all gene-mutation pair coordinates
- mosaic_nextflow.py      # python script executed by mosaic_get_anova.nf

# System requirement

Nextflow 20.07.1 (or later)

Java 11 (or later, up to 18) : The current execution uses Java JDK-17 

Docker 1.10 (or later) 

Code/text editor (e.g nano)

# Installations
Installing Docker : visit https://docs.docker.com/get-docker/

# Builind the container
A Docker container with all tools (python, nextflow, java, pandas, scipy, nano, datatest and unitest2 (both for unit testing) except installation of Docker which should be installed separately on the local machine) can be built from the Dockerfile present.

# The docker image 
The docker image is built to be run interactively in a container. It contains the following files:
- mosaic.py           # to be run with the command "python3 mosaic.py" on the shell terminal. Runs one-way anova with python
  and generates a "oneway.csv" file that contains anova computation for all mutation-gene pair coordinates
- Gene_KOs.tsv
- Mutations.tsv
- test_mosaic.py      # to be run with the command "python3 test_mosaic.py" on the shell terminal inside the container
- mosaic_get_list.nf  # Splits files by gene and mutation, and outputs lists of genes and list of mutation respeetivey. 
- mosaic_get_anova.nf # Computes anova for gene-mutation pair coordiante. 
- mosaic_nextflow.py  # python script executed by mosaic_get_anova.nf



# Unit testing.
- Executed with the script test_mosaic.py ("python3 test_mosaic.py")
- Quantile normalisation and One-way anova assume data are normalised and follow normal distribution. 
- Data in Mutaton.tsv file are expected to be either 1 or zero
- Unit testing script was written on this premise.
- To test the code, any non-zero and/or none-one value inserted into the table will throw an error when 
  test_mosaic.py is run and the affected columns is identied, otherwise the outome gives OK

# Interractive code editor inside the container
- The image is built with nano installed. This can be used to alter the Mutation.tsv file in order to test the test_mosaic.py script


# NEXTFLOW EXECUTION   (NOTE: all nextflow scripts should be run with the command "nextflow run script.nf -ansi-log false")

# Execution files and step 1

### STEP 1
- mosaic_get_lists.nf     # generates a gene list (genelist.txt) and a mutation list (mutationlist.txt) that are used by step 2
Note: Run script for step 1 before step 2. Output for step one is input for step 2
### STEP 2
- mosaic_get_anova.nf     # generate a file (nextflow-output.txt) that contains anova computation on all mutation-gene pair coordinates
Note: Run script for step 2 after step 1. 
# Input files

- Gene_KOs.tsv        # From the experiment
- Mutations.tsv       # From the experiment
- mosaic_nextflow.py  # externally execuated by mosaic_get_anova.nf

# Output file
- mutationlist.txt     # contains list of mutations (generated from step 1)
- genelist.txt         # contaisn list of genes (generated from step 1)
- nextflow-output.tsv  # contains the anova output for all mutation-gene pair coordinates (generated from step 2)

# Nexflow execution command
- "nextflow run file.nf -ansi-log false"   # command to run on container shell terminal. Allows monitoring of each proces task 


# Extra information
The nextflow aspect for generating one-way anova output for this test is primarily dockerised, accorindg to the question in the test. If user wants to run the script outside a container on a local machine with underdockerised installations, the full path to the current working directory containing the input files on the host machine has to be supplied in the scripts 



# Execution summary:
- pthon3 mosaic.py         # python anova comptation for input Gene_KOs.tsv and Mutation.tsv files. Generates oneway.csv file
- python3 test_mosaic.py   # unit testing 
- nextflow run mosaic_get_lists.nf -ansi-log false # splits files by genes and mutations and generate mutationlist.txt and genelist.txt
- nextlfow run mosaic_get_anova.nf -ansi-log false # computes anova for all mutation-gene pair coordinates; generates nextflow-output.tsv

# END OF FILE  ####################