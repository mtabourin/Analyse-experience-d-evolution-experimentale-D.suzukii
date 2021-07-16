# Analyse experience d'évolution expérimentale *D.suzukii*

Différents scripts pour l'analyse de données RNAseq paired-end provenant d'une expérience d'évolution expérimentale de *D.suzukii*

## Description

### Analyse de l'expression des gènes et des éléments transposables
#### rnaseq.sh

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

#### analyse_Drosophila-suzukii.R

Ce script R (version 4.1.0) permet de faire l'analyse différentielle des comptages des lectures par gènes et part éléments transposables.
Pour utiliser ce script, vous devrez installer les packages suivant:
- DESeq2 (version 1.26.0)
- ggplot2 (version 3.3.4)
- ggvenn (version 0.1.8)

#### gene_ontology.R

Ce script permet de faire l'analyse d'enrichissement des termes G0 à partir d'un vecteur de gènes d'intéret et d'avoir une visualisation des résultats.
Pour utiliser ce script, vous devrez installer les packages suivant:
- AnnotationHub (version 3.0.0)
- clusterProfiler (version 4.0.0)
- ggplot2 (version 3.3.4)

### Analyse des SNP

#### Recherche des SNP
La recherche des SNPs à été faite à partir de données RNAseq avec le logiciel Kisspice (version 2.5.4) avec la commande:
```
./softwares/kissplice/build/bin/kissplice -r fastq1 -r fastq2 -o kissplice_out/ -d temporary/ -t 6 -v -s 2 -u

```
#### Transcriptome de référence
Un transcriptome de référence a été fait à partir de données RNAseq avec le logiciel Trinity 
```
Trinity --seqType fq --left fastq1  --right fastq2 --CPU 6 --max_memory 30G
```
##### filtre_fasta.py
Ce script permet à partir d'un fichier de sortie de Trinity au format fasta et d'une longueur de séquence, de créer un fichier fasta filtré avec seulement les séquences plus longues que la longueur donnée en entré.
Nous avons choisi de garder les séquences de longueur supérieur à 300 nt. 
