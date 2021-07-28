# Analyse experience d'évolution expérimentale *D.suzukii*

Différents scripts pour l'analyse de données RNAseq paired-end provenant d'une expérience d'évolution expérimentale de *D.suzukii*

## Données utilisées

Données RNAseq d'ovaires de *D.suzukii* issues de séquençage illumina paired-end (2 * 100 pb) qui proviennent d'une expérience d'évolution expérimentale (L. Olazcuaga et al. [1]).
Les échantillons utilisés:
- 2 réplicats pour la G0
- 2 réplicats d'évolution avec chacun 2 réplicats pour la G7 cerise
- 2 réplicats d'évolution avec chacun 2 réplicats pour la G7 fraise

Un fichier d'annotation du génome (gff3), un fichier multifasta des séquences nucléotidiques des contigs de *D.suzukii* et une table des gènes orthologues entre *D.melanogaster* et *D.suzukii* qui proviennent de la publication de Mathilde Paris et al.[2].

Des fichiers rosettes: un fichier au format texte contenant les informations sur les ET de *D.suzukii* et un fichier au format fasta contenant les séquences nucléotidiques de ces ET ont été récupérés, à partir de la publication de Vincent Mérel et al.[3].

## Description

### Analyse de l'expression des gènes et des éléments transposables

#### Création d'un fichier multifasta contenant les séquencences nucléotidiques des gènes de *D.suzukii*

1. Conversion du fichier gff3 au format bed avec gff2bed (version 2.4.35)
2. Garder que les lignes qui correspondent a un gène complet avec le script **cleaning_bed.py** (python version 3.8.5)
3. Créer le fasta avec bedtools getfasta (version 2.21.0)

Le fasta final ne contenait pas les gènes sur les contigs suivants (le chiffre entre parenthèses correspond au nombre de gènes sur le contig): 152 (10), 199 (13), 219 (2), 274 (6), 290 (2), 295 (3), 331 (1), 338 (3), 343 (3), 370 (3), 376 (7), 379 (1), 417 (5), 420 (1), 463 (10), 478 (1), 499 (1), 527 (6), 602 (2), 603 (4), 615 (3) et short-contig_355 (4).
Sachant que 16 905 gènes sont annotés dans le fichier gff3.

#### rnaseq.sh

Ce script bash permet de faire un comptage des lectures par gènes et par éléments transposables à partir de données RNAseq, d'un fichier fasta de référence et 2 fichiers rosettes (.txt et .fasta).
Ce script utilise les outils suivant:
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

Ce script R (version 4.1.0) permet de faire l'analyse différentielle des comptages des lectures par gènes et part éléments transposables à partir de tables de comptages. Il permet aussi de produire des graphiques pour la visualisation.
Ce script utilise les packages suivant:
- DESeq2 (version 1.26.0)
- ggplot2 (version 3.3.4)
- ggvenn (version 0.1.8)

#### gene_ontology.R

Ce script R (version 4.1.0) permet de faire l'analyse d'enrichissement des termes G0 à partir d'un vecteur de gènes d'intéret et d'avoir une visualisation des résultats. Il permet aussi de produire des graphiques pour la visualisation.
Ce script utilisent les packages suivant:
- AnnotationHub (version 3.0.0)
- clusterProfiler (version 4.0.0)
- ggplot2 (version 3.3.4)

Ce script a été utilisé avec les identifiants des gènes orthologues entre *D.melanogaster* et *D.suzukii*.

### Recherche des variants (SNPs et INDELs)

La recherche des variants a été faite avec HISAT2 (version 2.2.0) et les outils GATK (version 4.2.0.0).

#### Créer un dictionnaire de séquences pour le fasta de reférence
Cette étape est faite avec l'outil CreateSequenceDictionary de GATK, avec la commande suivante:
```
./softwares/gatk-4.2.0.0/gatk CreateSequenceDictionary -R Drophila-suzukii.fasta
```
#### Indexation du fasta de référence
Cette étape est faite avec Samtools (version 1.10), avec la commande suivante:
```
samtools faidx Drosophila-suzukii.fasta
```
#### Alignement des lectures sur le génome de référence
L'alignement est fait avec HISAT2 (version 2.2.0) pour chaque échantillon avec la commande suivante:
```
HISAT2 -p 4 -x ref.index -1 R1.fastq -2 R2.fastq -S output.sam
```
#### Conversion du fichier SAM en BAM
La converssion est faite avec Samtools (version 1.10) pour chaque échantillon, avec la commande suivante:
```
SAMTOOLS view -bS -@ 3 file.sam" > output.bam
```
#### Trie des alignements par nom de requête
Le trie est fait avec l'outil SortSam de GATK pour chaque échantillon, avec la commande suivante:
```
./softwares/gatk-4.2.0.0/gatk SortSam -I file.bam -O output.bam -SO queryname
```
#### Attribuer toutes les lectures de chaque fichier à un seul nouveau groupe de lecture
Cette étape est faite avec l'outil AddOrReplaceReadGroups de GATK pour chaque échantillon, avec la commande suivante:
```
./softwares/gatk-4.2.0.0/gatk AddOrReplaceReadGroups -I file.bam -O output.bam -RGID name -RGLB name -RGPL ILLUMINA -RGPU name -RGSM sample

```
#### Marquer les doublons et trier par ordre de coordonnées
Cette étape est faite avec l'outil MarkDuplicatesSpark de GATK pour chaque échantillon, avec la commande suivante:
```
./softwares/gatk-4.2.0.0/gatk MarkDuplicatesSpark -I file.bam -O output.bam --spark-master local[6]
```
#### Recherche des SNP et des INDEL
Cette étape est faite avec l'outil HaplotypeCaller de GATK pour chaque échantillon, avec la commande suivante:
```
./softwares/gatk-4.2.0.0/gatk HaplotypeCaller -R ref.fasta -I file.bam -O output.g.vcf.gz -ERC GVCF
```
#### Fusionner les fichiers GVCF de chaque échantillon en un seule fichier GVCF
Cette étape est faite avec l'outil CombineGVCFs de GATK, avec la commande suivante:
```
./softwares/gatk-4.2.0.0/gatk CombineGVCFs -V ech1.g.vcf.gz -V ech2.g.vcf.gz -R ref.fasta -O output.g.vcf.gz

```
#### Faire un génotypage conjoint sur le fichier contenant tous les échantillons
Cette étape est faite avec l'outil GenotypeGVCFs de GATK, avec la commande suivante:
```
./softwares/gatk-4.2.0.0/gatk GenotypeGVCFs -R ref.fasta -V cohorte.g.vcf.gz -O output.vcf.gz

```
#### Filtrer les variants
- Sélectionnez un sous-ensemble de l'ensemble d'appels SNP
```
./softwares/gatk-4.2.0.0/gatk SelectVariants -V file.vcf.gz -select-type SNP -O output.vcf.gz

```
- Sélectionnez un sous-ensemble de l'ensemble d'appels INDEL
```
./softwares/gatk-4.2.0.0/gatk SelectVariants -V file.vcf.gz -select-type INDEL -O output.vcf.gz

```
- Sélectionnez un sous-ensemble de l'ensemble d'appels MIXED
```
./softwares/gatk-4.2.0.0/gatk SelectVariants -V file.vcf.gz -select-type MIXED -O output.vcf.gz

```
- Filtrage en dur
Le filtrage à été en fonction des recommandations de "GATK Best Practices" avec l'outil VAriantFiltration de GATK.
  - Filtre sur les SNP
  ```
  ./softwares/gatk-4.2.0.0/gatk VariantFiltration -V file.vcf.gz -filter "QD < 2.0" --filter-name "QD2"  -filter "QUAL < 30.0" --filter-name "QUAL30"  -filter "SOR > 3.0" --filter-name "SOR3" -filter "FS > 60.0" --filter-name "FS60" -filter "MQ < 40.0" --filter-name "MQ40"  -filter "MQRankSum < -12,5" --filter-name "MQRankSum-12,5" -filter "ReadPosRankSum < -8.0" --filter-name "ReadPosRankSum-8" -O output.vcf.gz
  ```
  - Filtre sur les INDEL
  ```
  ./softwares/gatk-4.2.0.0/gatk VariantFiltration -V file.vcf.gz -filter "QD < 2.0" --filter-name "QD2" -filter "QUAL < 30.0" --filter-name "QUAL30" -filter "FS > 200.0" --filter-name "FS200" -filter "ReadPosRankSum < -20.0" --filter-name "ReadPosRankSum-20" -O output.vcf.gz
  ```
  - Filtre sur les MIXED
  ```
  ./softwares/gatk-4.2.0.0/gatk VariantFiltration -V file.vcf.gz -filter "QD < 2.0" --filter-name "QD2" -filter "QUAL < 30.0" --filter-name "QUAL30" -filter "FS > 200.0" --filter-name "FS200" -filter "ReadPosRankSum < -20.0" --filter-name "ReadPosRankSum-20" -O output.vcf.gz
  ```
#### Combiner les fichiers VCF filtrés
Cette étape est faite avec l'outil MergeVcfs de GATK, avec la commande suivante:
```
./softwares/gatk-4.2.0.0/gatk MergeVcfs -I SNP.vcf.gz -I INDEL.vcf.gz -I MIXED.vcf.gz -O output.vcf.gz
```
#### Convertir le VCF final en table
Cette étape est faite avec l'outil VariantsToTable de GATK, avec la commande suivante:
```
./softwares/gatk-4.2.0.0/gatk VariantsToTable -V file.vcf.gz -F CHROM -F POS -F TYPE -F HET -F HOM.VAR -F NCALLED -GF GT -GF AD -GF PL -O output.table
```
Chaque ligne de cette table correspond à une variation.
La table est composé de 6 colonnes principales:
- CHROM: le nom du chromosome/contig/gène sur lequel la variation se trouve
- POS: la position de la variation sur le chromosome/conti/gène
- TYPE: le type de variation 
- HET: nombre de génotypes hétérozygote
- HOM-VAR: le nombre de génotypes variants homozygotes
- NCALLED: le nombre d'échantillons appelés pour cette variation
Ensuite pour chaque échantillon, il y a 3 colonnes:
- ech.GT: le génotype de l'échantillon
- ech.AD: la profondeur de chaque allèle
- ech.PL: probabilités "normalisées" à l'echelle de Phred des génotypes possibles. Les valeurs de PL sont "normalisées" de sorte que le PL du génotype le plus probable soit 0 dans l'échelle Phred, ce ne sont donc pas des probabilités et les autres valeurs sont mises à l'échelle par rapport à ce génotype le plus probable.

### Analyse des variants, script analyse_variants.R
L'analyse des variants est faite à partir de la table créée avec GATK.
Cette analyse est faite avec R (version 4.1.0) et le package Tidyverse (version 1.3.1).
Ce script permet d'avoir:
- le nombre de variant par échantillon et une visualisation
- le nombre de positions hétérizygotes par échantillon et une visualisation
- à partir d'une liste de gènes d'intéret (ici, une liste de gènes différentiellement exprimés):
  - le nombre de variant par échantillon pour ces gènes et une visualisation 
  - le nombre de positions hétérizygotes par échantillon pour ces gènes et une visualisation

### Transcriptome de référence
Un transcriptome de référence a été fait à partir de données RNAseq avec le logiciel Trinity 
```
Trinity --seqType fq --left fastq1  --right fastq2 --CPU 6 --max_memory 30G
```
##### filtre_fasta.py
Ce script permet à partir d'un fichier de sortie de Trinity au format fasta et d'une longueur de séquence, de créer un fichier fasta filtré avec seulement les séquences plus longues que la longueur donnée en entré.
Nous avons choisi de garder les séquences de longueur supérieur à 300 nt pour notre transcriptome de référence.

## Références

[1] L. Olazcuaga et al., « Adaptation and correlated fitness responses over two time scales
in Drosophila suzukii populations evolving in different environments », Journal of
Evolutionary Biology, vol. n/a, n o n/a, doi: 10.1111/jeb.13878.

[2] M. Paris et al., « Near-chromosome level genome assembly of the fruit pest Drosophila
suzukii using long-read sequencing », Sci Rep, vol. 10, n o 1, Art. n o 1, juill. 2020, doi:
10.1038/s41598-020-67373-z.

[3] V. Mérel et al., « The worldwide invasion of Drosophila suzukii is accompanied by a
large increase of transposable element load and a small number of putatively adaptive
insertions », Mol Biol Evol, doi: 10.1093/molbev/msab155.
