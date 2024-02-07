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
        if [ ${i::1}!="-" ]
        then
            echo $(exif $filename | sed "${i}q;d" | cut -d "|" -f2)
        fi
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
    case $1 in 
        "rx")
            echo $(exif $filename | grep "^R'esolution X" | tail -1 | cut -d "|" -f2)
            ;;
        "ry")
            echo $(exif $filename | grep "^R'esolution Y" | tail -1 | cut -d "|" -f2)
            ;;
        "runit")
            echo $(exif $filename | grep "^Unit" | tail -1 | cut -d "|" -f2)
            ;;
        "date")
            echo $(exif $filename | grep "^Date et heure " | tail -1 | cut -d "|" -f2)
            ;;
        "largeur")
            echo $(exif $filename | grep "^Largeur" | tail -1 | cut -d "|" -f2)
            ;;
        "longueur")
            echo $(exif $filename | grep "^Longueur" | tail -1 | cut -d "|" -f2)
            ;;
        "compression")
            echo $(exif $filename | grep "^Compression" | tail -1 | cut -d "|" -f2)
            ;;
        "echantillon")
            echo $(exif $filename | grep "^'Echantillons" | tail -1 | cut -d "|" -f2)
            ;;
        "desc")
            echo $(exif $filename | grep "^Description" | tail -1 | cut -d "|" -f2)
            ;;
        *)
            echo "le $i paramètre n'existe pas"
            exif 2
            ;;
    esac
else 
    echo "ce paramètre n'existe pas"
    exit 3;
fi