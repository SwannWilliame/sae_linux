#!/bin/bash

if [ ! -f $1 ]
then
    echo "fichier $1 n'existe pas"
    exit 1;
fi

filename=$1
shift

if [ $# -eq 0 ]
then
    i=5
    while [ $i -lt 25 ]
    do
        echo $(exif $filename | sed "${i}q;d" | cut -d "|" -f2)
        let  i++
        if [ $i -eq 16 ]
        then
            let  i++
            let  i++
            let  i++
        fi
    done
elif [ $1="-i" ]
then
    shift
    for i in $*
    do
        case $i in 
            "rx")
                echo $(exif $filename | sed '5q;d' | cut -d "|" -f2)
                ;;
            "ry")
                echo $(exif $filename | sed '6q;d' | cut -d "|" -f2)
                ;;
            "runit")
                echo $(exif $filename | sed '7q;d' | cut -d "|" -f2)
                ;;
            "logiciel")
                echo $(exif $filename | sed '8q;d' | cut -d "|" -f2)
                ;;
            "date")
                echo $(exif $filename | sed '9q;d' | cut -d "|" -f2)
                ;;
            "largeur")
                echo $(exif $filename | sed '10q;d' | cut -d "|" -f2)
                ;;
            "longueur")
                echo $(exif $filename | sed '11q;d' | cut -d "|" -f2)
                ;;
            "bit")
                echo $(exif $filename | sed '12q;d' | cut -d "|" -f2)
                ;;
            "compression")
                echo $(exif $filename | sed '13q;d' | cut -d "|" -f2)
                ;;
            "interpret")
                echo $(exif $filename | sed '14q;d' | cut -d "|" -f2)
                ;;
            "echantillon")
                echo $(exif $filename | sed '15q;d' | cut -d "|" -f2)
                ;;
            "espcouleur")
                echo $(exif $filename | sed '19q;d' | cut -d "|" -f2)
                ;;
            "exifv")
                echo $(exif $filename | sed '20q;d' | cut -d "|" -f2)
                ;;
            "flashv")
                echo $(exif $filename | sed '21q;d' | cut -d "|" -f2)
                ;;
            "lat")
                echo $(exif $filename | sed '22q;d' | cut -d "|" -f2)
                ;;
            "long")
                echo $(exif $filename | sed '23q;d' | cut -d "|" -f2)
                ;;
            "altitude")
                echo $(exif $filename | sed '24q;d' | cut -d "|" -f2)
                ;;
            *)
                echo "le $i paramètre n'existe pas"
                exif 2
                ;;
        esac
    done
else 
    echo "ce paramètre n'existe pas"
    exit 3;
fi