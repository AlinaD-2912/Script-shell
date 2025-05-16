#!/bin/bash
rm -rf employees_WDGAS/BU
rm -rf employees_WDGAS/IT
rm -rf employees_WDGAS/HR
rm -rf employees_WDGAS/WDGAS

if [ ! -d "employees_WDGAS/BU" ]; then
	mkdir employees_WDGAS/BU
	echo "Dossier BU creé"
else
	echo "Dossier BU déja existe"
fi
if [ ! -d "employees_WDGAS/HR" ]; then
	mkdir employees_WDGAS/HR 
	echo "Dossier HR creé"
else
	echo "Dossier HR déja existe"
fi
if [ ! -d "employees_WDGAS/IT" ]; then
	mkdir employees_WDGAS/IT 
	echo "Dossier IT creé"
else
	echo "Dossier IT déja existe"
fi

unzip ../WDGAS_employee.zip -d employees_WDGAS

path=(employees_WDGAS/WDGAS/*.data)
total=${#path[@]}
existe=0
for fichier in employees_WDGAS/WDGAS/*.data; do
	if [ -f "$fichier" ]; then
		((existe++))
		echo "Fichier $fichier existe"
	else
		echo "Fichier $fichier n'existe pas"
	fi
done

if [ "$existe" -eq "$total" ]; then
	echo "--- Tous les fichiers existent ---"
else
	echo "--- Que $existe fichiers de $total exitent ---"
fi

# deplacement
for fichier in employees_WDGAS/WDGAS/*.data; do
	nom=$(basename "$fichier")
	if echo "$nom" | grep -q "IT"; then
		mv "$fichier" employees_WDGAS/IT
	elif echo "$nom" | grep -q "HR"; then
		mv "$fichier" employees_WDGAS/HR
	elif echo "$nom" | grep -q "BU"; then
		mv "$fichier" employees_WDGAS/BU
	else
		echo "$fichier pas de departement"
	fi
done

# tri
for fichier in employees_WDGAS/BU/*.data; do
	nom=$(basename "$fichier")
	nom_fichier=$(echo "$nom" | grep -oE '[A-Z][a-z]+_[A-Z][a-z]+')
	if [ -n "$nom_fichier" ]; then #n line
		nouveau_nom="${nom_fichier}.data"
		mv "$fichier" "employees_WDGAS/BU/$nouveau_nom"
	else
		echo "error"
	fi
done
for fichier in employees_WDGAS/IT/*.data; do
	nom=$(basename "$fichier")
	nom_fichier=$(echo "$nom" | grep -oE '[A-Z][a-z]+_[A-Z][a-z]+')
	if [ -n "$nom_fichier" ]; then
		nouveau_nom="${nom_fichier}.data"
		mv "$fichier" "employees_WDGAS/IT/$nouveau_nom"
	else
		echo "error"
	fi
done
for fichier in employees_WDGAS/HR/*.data; do
	nom=$(basename "$fichier")
	nom_fichier=$(echo "$nom" | grep -oE '[A-Z][a-z]+_[A-Z][a-z]+')
	# -o shows the exact similar line to the condition in grep
	# -E extended regex, to use +, |, {} without \
	if [ -n "$nom_fichier" ]; then
		nouveau_nom="${nom_fichier}.data"
		mv "$fichier" "employees_WDGAS/HR/$nouveau_nom"
	else
		echo "error"
	fi
done