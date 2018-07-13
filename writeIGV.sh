#!/bin/bash

#this should be either hg19 or hg38
ref=$1
echo "<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>"
echo "<Session genome=\""$ref"\" hasGeneTrack=\"true\" hasSequenceTrack=\"true\" locus=\"All\" nextAutoscaleGroup=\"4\" path=\"\" version=\"8\">"
echo -e "\t<Resources>"

#put in all the file paths
for i in "${@:2}"; do 
    echo -e "\t\t<Resource path=\""$i"\"/>" 
done
echo -e "\t</Resources>"
echo "</Session>"
