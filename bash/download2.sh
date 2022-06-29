#!/bin/bash

i=1
dir=$1
locate='aula'
while read url 
do
        if grep "$url" <<< "aula"; then
            echo 'opa'
        fi
        # wget $url -O $1video${i}.mp4
        

        ((i++))
done < $1links.txt

# echo "local to save: $1"
#cp $1video1.mp4 $1video1-copiado.mp4