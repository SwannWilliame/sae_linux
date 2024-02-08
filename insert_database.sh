#!/bin/bash

for i in 'Voie lactee' 'Cosmic Rose' 'Galaxie du Moulinet'
do
    sql_exe.sh INSERT INTO galaxie(nom) VALUES ($i);
done