#!/bin/bash


# if [ ! -d "employees_WDGAS/BU" ]; then
# 	mkdir employees_WDGAS/BU
# 	echo "Dossier BU creé"
# else
# 	echo "Dossier BU déja existe"
# fi
# if [ ! -d "employees_WDGAS/HR" ]; then
# 	mkdir employees_WDGAS/HR 
# 	echo "Dossier HR creé"
# else
# 	echo "Dossier HR déja existe"
# fi
# if [ ! -d "employees_WDGAS/IT" ]; then
# 	mkdir employees_WDGAS/IT 
# 	echo "Dossier IT creé"
# else
# 	echo "Dossier IT déja existe"
# fi


# ---- verifier que tous les fichiers existent -------

# path=(employees_WDGAS/WDGAS/*.data)
# total=${#path[@]}
# existe=0
# for fichier in employees_WDGAS/WDGAS/*.data; do
# 	if [ -f "$fichier" ]; then
# 		((existe++))
# 		echo "Fichier $fichier existe"
# 	else
# 		echo "Fichier $fichier n'existe pas"
# 	fi
# done
# if [ "$existe" -eq "$total" ]; then
# 	echo "--- Tous les fichiers existent ---"
# else
# 	echo "--- Que $existe fichiers de $total exitent ---"
# fi


# ----- Le fichier sera déplacé dans le dossier ayant le nom approprié. -----------

# for fichier in employees_WDGAS/WDGAS/*.data; do
# 	nom=$(basename "$fichier")
# 	if echo "$nom" | grep -q "IT"; then
# 		mv "$fichier" employees_WDGAS/IT
# 	elif echo "$nom" | grep -q "HR"; then
# 		mv "$fichier" employees_WDGAS/HR
# 	elif echo "$nom" | grep -q "BU"; then
# 		mv "$fichier" employees_WDGAS/BU
# 	else
# 		echo "$fichier pas de departement"
# 	fi
# done


#Le fichier sera renommé en <nom>_<prénom>.data.
# for fichier in employees_WDGAS/BU/*.data; do
# 	nom=$(basename "$fichier")
# 	nom_fichier=$(echo "$nom" | grep -oE '[A-Z][a-z]+_[A-Z][a-z]+')
# 	if [ -n "$nom_fichier" ]; then #n line
# 		nouveau_nom="${nom_fichier}.data"
# 		mv "$fichier" "employees_WDGAS/BU/$nouveau_nom"
# 	else
# 		echo "error"
# 	fi
# done
# for fichier in employees_WDGAS/IT/*.data; do
# 	nom=$(basename "$fichier")
# 	nom_fichier=$(echo "$nom" | grep -oE '[A-Z][a-z]+_[A-Z][a-z]+')
# 	if [ -n "$nom_fichier" ]; then
# 		nouveau_nom="${nom_fichier}.data"
# 		mv "$fichier" "employees_WDGAS/IT/$nouveau_nom"
# 	else
# 		echo "error"
# 	fi
# done
# for fichier in employees_WDGAS/HR/*.data; do
# 	nom=$(basename "$fichier")
# 	nom_fichier=$(echo "$nom" | grep -oE '[A-Z][a-z]+_[A-Z][a-z]+')
# 	# -o shows the exact similar line to the condition in grep
# 	# -E extended regex, to use +, |, {} without \
# 	if [ -n "$nom_fichier" ]; then
# 		nouveau_nom="${nom_fichier}.data"
# 		mv "$fichier" "employees_WDGAS/HR/$nouveau_nom"
# 	else
# 		echo "error"
# 	fi
# done



# ------ plus loin ----------
# Adaptez le script pour que le nom du dossier racine soit passé en nom de fichier
# dossier="employees_WDGAS/HR"
# destination="employees_WDGAS/test"
# departement=$(basename "$dossier")
# count=0
# for fichier in "$dossier"/*.data; do
#     [ -f "$fichier" ] || continue
#     nom_fichier=$(basename "$fichier" .data) #.data pour supprimer .data au fin de la fichier
#     nouveau_nom="${nom_fichier}_${departement}.data"
#     mv "$fichier" "$dossier/$nouveau_nom"
# done


# ----- Combien de salariés s’appellent John ou Jessie ? --------

# dossier="employees_WDGAS/BU"
# count=0
# for fichier in "$dossier"/*.data; do
#     nom_fichier=$(basename "$fichier" .data)
#     prenom=$(echo "$nom_fichier" | grep -oE '^[A-Z][a-z]+')
#     if [[ "$prenom" == "John" || "$prenom" == "Jessi" ]]; then
#         ((count++))
#     fi
# done
# echo "Il y a $count employés qui s'appellent John ou Jessi dans $dossier."


# ------ Adaptez le script pour que le nom du dossier racine soit passé en argument ---------
dossier="employees_WDGAS/BU"
departement=$(basename "$dossier")

for fichier in "$dossier"/*.data; do
	echo "departement=$departement" >> "$fichier"
done 