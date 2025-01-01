// get your message in the festive-message/output.txt file.

params.outdir = "festive-message"
params.greeting = "Have a happy and prosperous CHRISTMAS everyone!! Have a blissful festive celebration. Cheers!"
process weekend {
tag{"Writing festive messages into output file ..."}

publishDir params.outdir, mode:'copy'

input:
val y
output:
path "output.txt"

script:

"""
echo $y > output.txt
"""
}
workflow {
greeting_ch = Channel.from (params.greeting)
weekend (greeting_ch)
