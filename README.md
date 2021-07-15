# Analyse experience d'évolution expérimentale *D.suzukii*

## Description
Différents scripts pour l'analyse de données RNAseq paired-end provenant d'une expérience d'évolution expérimentale de *D.suzukii*

## Les scripts

### rnaseq.sh

Ce script bash permet de faire un comptage des lectures par gènes et par éléments transposables.
Pour utiliser ce script, vous devrez installer les outils suivant:
- HISAT2 (version 2.2.0)
- Samtools (version 1.10)
- eXpress (version 1.5.1)
- TEcount (version 1.0.0)

Il est composé de différentes parties:
- Indexation du génome de référence avec HISAT2
- Alignement des lectures sur le génome de référence avec HISAT2
- Conversion au format ban et trie avec Samtools
- Comptage des lectures par gènes avec eXpress
- Comptage des lectures par éléments transposables avec le module TEcount de TEtools

### analyse_Drosophila-suzukii.R

Ce script R (version 4.1.0) permet de faire l'analyse différentielle des comptages des lectures par gènes et part éléments transposables.
Pour utiliser ce script, vous devrez installer les packages suivant:
- DESeq2 (version 1.26.0)
- ggplot2 (version 3.3.4)
- ggvenn (version 0.1.8)

### gene_ontology.R

Ce script permet de faire l'analyse d'enrichissement des termes G0 à partir d'un vecteur de gènes d'intéret et d'avoir une visualisation des résultats.
Pour utiliser ce script, vous devrez installer les packages suivant:
- AnnotationHub (version 3.0.0)
- clusterProfiler (version 4.0.0)
- ggplot2 (version 3.3.4)




