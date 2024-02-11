#!/bin/bash
sudo mysql < "sqlscript.sql";  #on lance le script de création de la database à chaque pour faciliter de test
sudo mysql < "static_data_insert.sql";
cpt=1
for doss in $(ls -R DB_Astro | grep '^DB.*[0-9]:$' | sed 's/://g')
do
	for file in $(ls $doss)
	do
		if [ -f "$doss/$file" ]
		then
			file_ref="$doss/$file"
			galaxie_id="$(echo $doss | cut -d/ -f3)"
			categorie="$(echo $doss | cut -d/ -f2)"
			if [ "$categorie" = "Others" ]
			then
				categorie_id=2
				constellation_id="$(echo $doss | cut -d/ -f4)"
				sh ./sql_exe.sh INSERT INTO image \(id, nom, description_image, res_x, res_y, date_creation, largeur, longueur, echantillon_par_pixel, image_data, categorie_id, unite_res_id, type_compression_id, constellation_id, galaxie_id\) VALUES \($cpt, \'$file\', \'$(./exifinfo.sh $file_ref -i desc)\', \'$(./exifinfo.sh $file_ref -i rx)\', \'$(./exifinfo.sh $file_ref -i ry)\', \'$(./exifinfo.sh $file_ref -i date)\', \'$(./exifinfo.sh $file_ref -i largeur)\', \'$(./exifinfo.sh $file_ref -i longueur)\', \'$(./exifinfo.sh $file_ref -i echantillon)\', \'$file_ref\', \'$categorie_id\', \'$(./exifinfo.sh $file_ref -i runit)\', \'$(./exifinfo.sh $file_ref -i compression)\', $constellation_id, $galaxie_id\)
			else
				categorie_id=1
				sh ./sql_exe.sh INSERT INTO image \(id, nom, description_image, res_x, res_y, date_creation, largeur, longueur, echantillon_par_pixel, image_data, categorie_id, unite_res_id, type_compression_id, constellation_id, galaxie_id\) VALUES \($cpt, \'$file\', \'$(./exifinfo.sh $file_ref -i desc)\', \'$(./exifinfo.sh $file_ref -i rx)\', \'$(./exifinfo.sh $file_ref -i ry)\', \'$(./exifinfo.sh $file_ref -i date)\', \'$(./exifinfo.sh $file_ref -i largeur)\', \'$(./exifinfo.sh $file_ref -i longueur)\', \'$(./exifinfo.sh $file_ref -i echantillon)\', \'$file_ref\', \'$categorie_id\', \'$(./exifinfo.sh $file_ref -i runit)\', \'$(./exifinfo.sh $file_ref -i compression)\', NULL, $galaxie_id\)
			fi
			((cpt+=1))
		fi
	done
done