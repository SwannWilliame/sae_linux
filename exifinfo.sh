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
	echo $(exif $filename | grep '^Résolution X' | tail -1 | cut -d "|" -f2 | tr -d ' ')    
	echo $(exif $filename | grep '^Résolution Y' | tail -1 | cut -d "|" -f2 | tr -d ' ')
	echo $(exif $filename | grep '^Unit' | tail -1 | cut -d "|" -f2 | tr -d ' ')
	echo $(exif $filename | grep '^Date et heure ' | tail -1 | cut -d "|" -f2 | tr -d ' ')
	echo $(exif $filename | grep '^Largeur' | tail -1 | cut -d "|" -f2 | tr -d ' ')
	echo $(exif $filename | grep '^Longueur' | tail -1 | cut -d "|" -f2 | tr -d ' ')
	echo $(exif $filename | grep '^Compression' | tail -1 | cut -d "|" -f2 | tr -d ' ')
	echo $(exif $filename | grep '^Échantillons' | tail -1 | cut -d "|" -f2 | tr -d ' ')
	echo $(exif $filename | grep '^Description' | tail -1 | cut -d "|" -f2 | tr -d ' ')
elif [ $1="-i" ]
then
    shift
    case $1 in 
        "rx")
            result=$(exif $filename | grep '^Résolution X' | tail -1 | cut -d "|" -f2 | tr -d ' ')
            echo $result
            ;;
        "ry")
            result=$(exif $filename | grep '^Résolution Y' | tail -1 | cut -d "|" -f2 | tr -d ' ')
            echo $result
            ;;
        "runit")
            unit="$(exif $filename | grep '^Unit' | tail -1 | cut -d "|" -f2 | tr -d ' ')"
            if [ "$unit"="pouces" ]
		then
			echo 1
		else
			echo 2
		fi
            ;;
        "date")
            date="$(exif $filename | grep '^Date et heure ' | tail -1 | cut -d "|" -f2 | tr -d ' ' | head -c 10)"
            if [ -z "$date" ]
	    then
	    	echo 1111:11:11
	    else
	    	echo $date
	    fi
            ;;
        "largeur")
            result=$(exif $filename | grep '^Hauteur' | tail -1 | cut -d "|" -f2 | tr -d ' ')
            if [ -z $result ]
            then
                echo -1
            else 
            	echo $result
            fi
            ;;
        "longueur")
            result=$(exif $filename | grep '^Longeur' | tail -1 | cut -d "|" -f2 | tr -d ' ')
            if [ -z $result ]
            then
                echo -1
            else 
            	echo $result
            fi
            ;;
        "compression")
            compr="$(exif $filename | grep '^Compression' | tail -1 | cut -d "|" -f2 | tr -d ' ')"
            if [ "$compr"="Compression JPEG" ]
            then
                echo 1
            else
                echo 2
            fi
            ;;
        "echantillon")
            result=$(exif $filename | grep '^Échantillons' | tail -1 | cut -d "|" -f2 | tr -d ' ')
            if [ -z $result ]
            then
                echo -1
            else 
            	echo $result
            fi
            ;;
        "desc")
            result=$(exif $filename | grep '^Description' | tail -1 | cut -d "|" -f2 | tr -d ' ')
            echo $result
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