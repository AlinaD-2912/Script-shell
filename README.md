# 🔀 Employee Sorter – Script Bash

Un script Bash simple mais puissant conçu pour automatiser l'organisation de fichiers d'employés. Il trie les fichiers selon leur département (BU, HR, IT), les déplace dans les dossiers appropriés, et les renomme sous la forme `<Nom>_<Prénom>.data`.

## 📁 Fonctionnalités

- Création automatique des dossiers `BU`, `HR`, `IT` si non existants
- Vérification de l’existence des fichiers dans le dossier `WDGAS`
- Tri des fichiers `.data` dans le bon dossier en fonction de leur contenu
- Renommage des fichiers au format standardisé

## 📌 Arborescence attendue
employees_WDGAS/
├── BU/
├── HR/
├── IT/
└── WDGAS/
├── Alice_Dupont_BU.data
├── Marc_Durand_HR.data
├── Sophie_Tech_IT.data

## ⚙️ Comment exécuter

1. Placez tous les fichiers `.data` à trier dans `employees_WDGAS/WDGAS/`.
2. Exécutez le script dans un terminal :

```bash
bash mdsorter.sh
