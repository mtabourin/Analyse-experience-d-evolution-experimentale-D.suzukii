
library("DESeq2")
library("ggplot2")
library("ggvenn")

### chargement des donnees des comptes de lectures par gène

G0_1 <- read.table("counted_read/CNVR349_S1_express/results.xprs", h = T, sep = "\t")
G0_2 <- read.table("counted_read/CNVR350_S1_express/results.xprs", h = T, sep = "\t")
G7_C_11 <- read.table("counted_read/CNVR351_S1_express/results.xprs", h = T, sep = "\t")
G7_C_12 <- read.table("counted_read/CNVR352_S1_express/results.xprs", h = T, sep = "\t")
G7_C_31 <- read.table("counted_read/CNVR353_S1_express/results.xprs", h = T, sep = "\t")
G7_C_32 <- read.table("counted_read/CNVR354_S1_express/results.xprs", h = T, sep = "\t")
G7_F_11 <- read.table("counted_read/CNVR355_S1_express/results.xprs", h = T, sep = "\t")
G7_F_12 <- read.table("counted_read/CNVR356_S1_express/results.xprs", h = T, sep = "\t")
G7_F_31 <- read.table("counted_read/CNVR357_S1_express/results.xprs", h = T, sep = "\t")
G7_F_32 <- read.table("counted_read/CNVR358_S1_express/results.xprs", h = T, sep = "\t")

### creation du data frame des comptes de lectures par gène

counts_genes <- data.frame(
  G0_1 = round(G0_1$eff_counts[order(G0_1$target_id)]),
  G0_2 = round(G0_2$eff_counts[order(G0_2$target_id)]),
  G7_C_11 = round(G7_C_11$eff_counts[order(G7_C_11$target_id)]),
  G7_C_12 = round(G7_C_12$eff_counts[order(G7_C_12$target_id)]),
  G7_C_31 = round(G7_C_31$eff_counts[order(G7_C_31$target_id)]),
  G7_C_32 = round(G7_C_32$eff_counts[order(G7_C_32$target_id)]),
  G7_F_11 = round(G7_F_11$eff_counts[order(G7_F_11$target_id)]),
  G7_F_12 = round(G7_F_12$eff_counts[order(G7_F_12$target_id)]),
  G7_F_31 = round(G7_F_31$eff_counts[order(G7_F_31$target_id)]),
  G7_F_32 = round(G7_F_32$eff_counts[order(G7_F_32$target_id)]),
  row.names = sort(G0_1$target_id)
)

### chargement des donnees des comptes de lectures par ET

info_et <- read.table("counted_TE/CNVR349_S1_TEtools.txt", h=F)[,1:3]
info_et
names(info_et) <- c("famille", "superfamille", "ordre")

G0_1.et <- read.table("counted_TE/CNVR349_S1_TEtools.txt", h = F)[,4]
G0_2.et <- read.table("counted_TE/CNVR350_S1_TEtools.txt", h = F)[,4]
G7_C_11.et <- read.table("counted_TE/CNVR351_S1_TEtools.txt", h = F)[,4]
G7_C_12.et <- read.table("counted_TE/CNVR352_S1_TEtools.txt", h = F)[,4]
G7_C_31.et <- read.table("counted_TE/CNVR353_S1_TEtools.txt", h = F)[,4]
G7_C_32.et <- read.table("counted_TE/CNVR354_S1_TEtools.txt", h = F)[,4]
G7_F_11.et <- read.table("counted_TE/CNVR355_S1_TEtools.txt", h = F)[,4]
G7_F_12.et <- read.table("counted_TE/CNVR356_S1_TEtools.txt", h = F)[,4]
G7_F_31.et <- read.table("counted_TE/CNVR357_S1_TEtools.txt", h = F)[,4]
G7_F_32.et <- read.table("counted_TE/CNVR358_S1_TEtools.txt", h = F)[,4]

### creation du data frame des comptes de lectures par ET

counts_et = data.frame(
  G0_1 = G0_1.et,
  G0_2 = G0_2.et,
  G7_C_11 = G7_C_11.et,
  G7_C_12 = G7_C_12.et,
  G7_C_31 = G7_C_31.et,
  G7_C_32 = G7_C_32.et,
  G7_F_11 = G7_F_11.et,
  G7_F_12 = G7_F_12.et,
  G7_F_31 = G7_F_31.et,
  G7_F_32 = G7_F_32.et,
  row.names = info_et$famille
)

### combinaison par ligne de counts_et et counts_genes

counts_total <- rbind(counts_genes, counts_et)

dim(counts_genes)
#[1] 16813    10
dim(counts_total)
#[1] 20023    10

num_et = 16814:20023
num_gene = 0:16813 

######### Vérifier si les réplicats d'évolution sont identiques ################

### construction de la matrice de design en fonction des conditions

condition = c(rep("G0",2), rep("G7cerise1",2), rep("G7cerise2",2), 
              rep("G7fraise1",2), rep("G7fraise2",2))
colData = data.frame(condition)

dds = DESeqDataSetFromMatrix(counts_total, colData, 
                             design = formula(~ condition ))
dds = DESeq(dds)

### exploration des données

# normalisation avec le facteur de taille des librairies

DESeq.ds <- dds
colSums(counts(DESeq.ds))
DESeq.ds <- estimateSizeFactors(DESeq.ds)
DESeq.ds@colData$sizeFactor

# transformation logarithmique : réduire la variance des faibles comptages en 
# utilisant les tendance moyennes de dispersion
rld <- rlog(DESeq.ds, blind = FALSE)
rlog.norm.counts <- assay(rld) # permet de récupérer une matrice des valeurs log transformées

# mettre sous forme de matrice de distance
distance.m_rlog  <- as.dist(1 - cor(rlog.norm.counts , method = "pearson" ))

# clustering hiérarchique
plot(hclust(distance.m_rlog), labels = colnames(rlog.norm.counts),
     main = "nombre de lectures transformées rlog \ ndistance: corrélation de Pearson")

# ACP
plotPCA(rld) 

### Vérifier si les réplicats G7fraise1 et G7fraise2 sont identiques

## les gènes
res_F1_F2 = results(dds, contrast=c("condition","G7fraise1","G7fraise2"))
res_F1_g_F2 = res_F1_F2[num_gene,]
summary(res_F1_g_F2)

cutoff <- 0.01
topresults.res_F1_g_F2 <- res_F1_g_F2[which(res_F1_g_F2$padj < cutoff), ]

topresults.res_F1_g_F2
topresults.res_F1_g_F2 <- topresults.res_F1_g_F2[topresults.res_F1_g_F2$log2FoldChange> 2 | 
                                                   topresults.res_F1_g_F2$log2FoldChange< -2,]
topresults.res_F1_g_F2

plot(density(res_F1_g_F2$log2FoldChange[!is.na(res_F1_g_F2$log2FoldChange)]), main="log2FC", lwd=2)
abline(v=0, col="red", lwd=2)

## les ET
res_et_F1_F2 = res_F1_F2[num_et,]
summary(res_et_F1_F2)

cutoff <- 0.01
topresults.et_F1_F2 <- res_et_F1_F2[which(res_et_F1_F2$padj < cutoff), ]
topresults.et_F1_F2 <- topresults.et_F1_F2[topresults.et_F1_F2$log2FoldChange> 2 | 
                                             topresults.et_F1_F2$log2FoldChange< -2,]
topresults.et_F1_F2

### Vérifier si les réplicats G7cerise1 et G7cerise2 sont identiques

## les gènes
res_C1_C2 = results(dds, contrast=c("condition","G7cerise1","G7cerise2"))
res_C1_g_C2 = res_C1_C2[num_gene,]
summary(res_C1_g_C2)

cutoff <- 0.01
topresults.res_C1_g_C2 <- res_C1_g_C2[which(res_C1_g_C2$padj < cutoff), ]
topresults.res_C1_g_C2

topresults.res_C1_g_C2 <- topresults.res_C1_g_C2[topresults.res_C1_g_C2$log2FoldChange> 2 | 
                                                   topresults.res_C1_g_C2$log2FoldChange< -2,]
topresults.res_C1_g_C2

plot(density(res_C1_g_C2$log2FoldChange[!is.na(res_C1_g_C2$log2FoldChange)]), main="log2FC", lwd=2)
abline(v=0, col="red", lwd=2)

## les ET
res_et_C1_C2 = res_C1_C2[num_et,]
summary(res_et_C1_C2)

cutoff <- 0.01
topresults.et_C1_C2 <- res_et_C1_C2[which(res_et_C1_C2$padj < cutoff), ]
topresults.et_C1_C2 <- topresults.et_C1_C2[topresults.et_C1_C2$log2FoldChange> 2 | 
                                             topresults.et_C1_C2$log2FoldChange< -2,]
topresults.et_C1_C2


#################### Comparaison entre les conditions ##########################

### construction de la matrice de design en fonction des conditions

condition1 = c(rep("G0",2), rep("G7cerise",4), rep("G7fraise",4))
colData1 = data.frame(condition1)
dds1 = DESeqDataSetFromMatrix(counts_total, colData1, 
                              design = formula(~ condition1))
dds1 = DESeq(dds1)

### G7 fraise vs G0

## les genes
res_F_G0 = results(dds1, contrast=c("condition1","G7fraise","G0"))
res_F_g_G0 = res_F_G0[num_gene,]
summary(res_F_g_G0)
mcols(res_F_g_G0, use.names = TRUE)

plot(density(res_F_g_G0$log2FoldChange[!is.na(res_F_g_G0$log2FoldChange)]), main="log2FC", lwd=2)
abline(v=0, col="red", lwd=2)

cutoff <- 0.01
topresults.res_F_g_G0 <- res_F_g_G0[which(res_F_g_G0$padj < cutoff), ]
plot(density(topresults.res_F_g_G0$log2FoldChange
             [!is.na(topresults.res_F_g_G0$log2FoldChange)]), main="log2FC", 
     lwd=2, xlim=c(-3,3))
abline(v=0, col="red", lwd=2)

# Extraire les genes significativement regules à la hausse 
UP_topresults.F_g_G0 <- topresults.res_F_g_G0[topresults.res_F_g_G0$log2FoldChange> 2,]
UP_topresults.F_g_G0.sorted <- UP_topresults.F_g_G0[order(UP_topresults.F_g_G0$padj),]
UP_topgenes.F_g_G0 <- rownames(UP_topresults.F_g_G0.sorted)
UP_topgenes.F_g_G0 <- cbind(UP_topgenes.F_g_G0 , UP_topresults.F_g_G0.sorted[2:2])
UP_topgenes.F_g_G0
write.table(UP_topgenes.F_g_G0, file = "UP_topgenes.F_G0.csv", col.names = T, 
            row.names = F, quote = F)

# Extraire les genes significativement regules à la baisse
Down_topresults.F_g_G0 <- topresults.res_F_g_G0[topresults.res_F_g_G0$log2FoldChange< -2,]
Down_topresults.F_g_G0.sorted <- Down_topresults.F_g_G0[order(Down_topresults.F_g_G0$padj),]
Down_topgenes.F_g_G0 <- rownames(Down_topresults.F_g_G0.sorted)
Down_topgenes.F_g_G0 <- cbind(Down_topgenes.F_g_G0 , Down_topresults.F_g_G0.sorted[2:2])
Down_topgenes.F_g_G0
write.table(Down_topgenes.F_g_G0, file = "Down_topgenes.F_G0.csv", col.names = T, 
            row.names = F, quote = F)

## les ET

res_et_F_G0 = res_F_G0[num_et,]
summary(res_et_F_G0)

cutoff <- 0.01
topresults.et_F_G0 <- res_et_F_G0[which(res_et_F_G0$padj < cutoff), ]
topresults.et_F_G0
plot(density(topresults.et_F_G0$log2FoldChange
             [!is.na(topresults.et_F_G0$log2FoldChange)]), main="log2FC", lwd=2,
     xlim=c(-3,3))
abline(v=0, col="red", lwd=2)

topresults.et_F_G0 <- topresults.et_F_G0[topresults.et_F_G0$log2FoldChange> 2 |
                                           topresults.et_F_G0$log2FoldChange< -2,]
topresults.et_F_G0.sorted <- topresults.et_F_G0[order(topresults.et_F_G0$padj),]
topresults.et_F_G0.sorted
topET.et_F_G0 <- rownames(topresults.et_F_G0.sorted)
topET.et_F_G0 <- cbind(topET.et_F_G0 , topresults.et_F_G0.sorted[2:2])
topET.et_F_G0
write.table(topET.et_F_G0, file = "topET.F_G0.csv", col.names = T, row.names = F, 
            quote = F)

### G7 cerise vs G0

## les genes
res_C_G0 = results(dds1, contrast=c("condition1","G7cerise","G0"))
res_C_g_G0 = res_C_G0[num_gene,]
summary(res_C_g_G0)
mcols(res_C_g_G0, use.names = TRUE)

plot(density(res_C_g_G0$log2FoldChange[!is.na(res_C_g_G0$log2FoldChange)]), main="log2FC", lwd=2)
abline(v=0, col="red", lwd=2)

cutoff <- 0.01
topresults.res_C_g_G0 <- res_C_g_G0[which(res_C_g_G0$padj < cutoff), ]
plot(density(topresults.res_C_g_G0$log2FoldChange
             [!is.na(topresults.res_C_g_G0$log2FoldChange)]), main="log2FC", lwd=2, 
     xlim=c(-3,3))
abline(v=0, col="red", lwd=2)

# Extraire les genes significativement regules à la hausse 
UP_topresults.C_g_G0 <- topresults.res_C_g_G0[topresults.res_C_g_G0$log2FoldChange> 2,]
UP_topresults.C_g_G0.sorted <- UP_topresults.C_g_G0[order(UP_topresults.C_g_G0$padj),]
UP_topgenes.C_g_G0 <- rownames(UP_topresults.C_g_G0.sorted )
UP_topgenes.C_g_G0 <- cbind(UP_topgenes.C_g_G0 , UP_topresults.C_g_G0.sorted[2:2])
UP_topgenes.C_g_G0
write.table(UP_topgenes.C_g_G0, file = "UP_topgenes.C_G0.csv", col.names = T, 
            row.names = F, quote = F)

# Extraire les genes significativement regules à la baisse
Down_topresults.C_g_G0 <- topresults.res_C_g_G0[topresults.res_C_g_G0$log2FoldChange< -2,]
Down_topresults.C_g_G0.sorted <- Down_topresults.C_g_G0[order(Down_topresults.C_g_G0$padj),]
Down_topgenes.C_g_G0 <- rownames(Down_topresults.C_g_G0.sorted)
Down_topgenes.C_g_G0 <- cbind(Down_topgenes.C_g_G0 , Down_topresults.C_g_G0.sorted[2:2])
Down_topgenes.C_g_G0
write.table(Down_topgenes.C_g_G0, file = "Down_topgenes.C_G0.csv", col.names = T,
            row.names = F, quote = F)

## les ET

res_et_C_G0 = res_C_G0[num_et,]
summary(res_et_C_G0)

cutoff <- 0.01
topresults.et_C_G0 <- res_et_C_G0[which(res_et_C_G0$padj < cutoff), ]
plot(density(topresults.et_C_G0$log2FoldChange
             [!is.na(topresults.et_C_G0$log2FoldChange)]), main="log2FC", lwd=2, 
     xlim=c(-3,3))
abline(v=0, col="red", lwd=2)

topresults.et_C_G0 <- topresults.et_C_G0[topresults.et_C_G0$log2FoldChange> 2 | 
                                           topresults.et_C_G0$log2FoldChange< -2,]
topresults.et_C_G0.sorted <- topresults.et_C_G0[order(topresults.et_C_G0$padj),]
topET.et_C_G0 <- rownames(topresults.et_C_G0.sorted)
topET.et_C_G0 <- cbind(topET.et_C_G0 , topresults.et_C_G0.sorted[2:2])
topET.et_C_G0
write.table(topET.et_C_G0, file = "topET.C_G0.csv", col.names = T, row.names = F, 
            quote = F)

### G7 fraise vs G7 cerise

## les genes
res_C_F = results(dds1, contrast=c("condition1","G7cerise","G7fraise"))
res_C_F_g = res_C_F[num_gene,]
summary(res_C_F_g)
mcols(res_C_F_g, use.names = TRUE)

cutoff <- 0.01
topresults.res_C_F_g <- res_C_F_g[which(res_C_F_g$padj < cutoff), ]
plot(density(topresults.res_C_F_g$log2FoldChange
             [!is.na(topresults.res_C_F_g$log2FoldChange)]), main="log2FC", lwd=2, 
     xlim=c(-3,3))
abline(v=0, col="red", lwd=2)

# Extraire les genes significativement regules à la hausse
UP_topresults.C_F_g <- topresults.res_C_F_g[topresults.res_C_F_g$log2FoldChange> 2,]
UP_topresults.C_F_g.sorted <- UP_topresults.C_F_g[order(UP_topresults.C_F_g$padj),]
UP_topgenes.C_F_g <- rownames(UP_topresults.C_F_g.sorted )
UP_topgenes.C_F_g <- cbind(UP_topgenes.C_F_g , UP_topresults.C_F_g.sorted[2:2])
UP_topgenes.C_F_g
write.table(UP_topgenes.C_F_g, file = "UP_topgenes.C_F.csv", col.names = T, 
            row.names = F, quote = F)

# Extraire les genes significativement regules à la baisse
Down_topresults.C_F_g <- topresults.res_C_F_g[topresults.res_C_F_g$log2FoldChange< -2,]
Down_topresults.C_F_g.sorted <- Down_topresults.C_F_g[order(Down_topresults.C_F_g$padj),]
Down_topgenes.C_F_g <- rownames(Down_topresults.C_F_g.sorted)
Down_topgenes.C_F_g <- cbind(Down_topgenes.C_F_g , Down_topresults.C_F_g.sorted[2:2])
Down_topgenes.C_F_g
write.table(Down_topgenes.C_F_g, file = "Down_topgenes.C_F.csv", col.names = T, 
            row.names = F, quote = F)

## les ET

res_et_C_F = res_C_F[num_et,]
summary(res_et_C_F)

cutoff <- 0.01
topresults.et_C_F <- res_et_C_F[which(res_et_C_F$padj < cutoff), ]
plot(density(topresults.et_C_F$log2FoldChange
             [!is.na(topresults.et_C_F$log2FoldChange)]), main="log2FC", lwd=2,
     xlim=c(-3,3))
abline(v=0, col="red", lwd=2)

topresults.et_C_F <- topresults.et_C_F[topresults.et_C_F$log2FoldChange> 2 | 
                                         topresults.et_C_F$log2FoldChange< -2,]
topresults.et_C_F
topresults.et_C_F.sorted <- topresults.et_C_F[order(topresults.et_C_F$padj),]
topresults.et_C_F.sorted
topET.et_C_F <- rownames(topresults.et_C_F.sorted)
topET.et_C_F <- cbind(topET.et_C_F , topresults.et_C_F.sorted[2:2])
topET.et_C_F
write.table(topET.et_C_F, file = "topET.C_F.csv", col.names = T, row.names = F,
            quote = F)


############################# Visualisation ###################################

## comptes normalisés pour visualisation
counts_norm = as.data.frame(counts(dds1, normalize=T))
names(counts_norm) = names(counts_total)

counts_norm_moy = data.frame(
  G0 = apply(cbind(counts_norm$G0_1, counts_norm$G0_2), 1, mean),
  G7cerise = apply(cbind(counts_norm$G7_C_11, counts_norm$G7_C_12, counts_norm$G7_C_31, counts_norm$G7_C_32), 1, mean),
  G7fraise = apply(cbind(counts_norm$G7_F_11, counts_norm$G7_F_12, counts_norm$G7_F_31, counts_norm$G7_F_32), 1, mean),
  row.names = row.names(counts_norm)
)

counts_norm_moy_gene = counts_norm_moy[num_gene,]

counts_norm_moy_et = counts_norm_moy[num_et,]

## distribution du nombre de reads par gène

hist(log(rowMeans(counts_norm_moy_gene)+1),
     breaks=seq(0,20,1),col="grey",cex.lab=0.8,
     main="distribution du nombre de reads par gène",
     xlab="Valeur du comptage (nb reads/gènes) log(count+1)",
     ylab="Fréquence du comptage")

## distribution du nombre de reads par ET

hist(log(rowMeans(counts_norm_moy_et)+1),
     breaks=seq(0,15,1), col="grey",cex.lab=0.8,
     main="distribution du nombre de reads par ET",
     xlab="Valeur du comptage (nb reads/ET) log(count+1)",
     ylab="Fréquence du comptage")

## nombre de gènes différentiellement exprimés par condition

UP_g <- c(dim(UP_topresults.F_g_G0)[1],dim(UP_topresults.C_g_G0)[1],
          dim(UP_topresults.C_F_g)[1])
Down_g <-c(dim(Down_topresults.F_g_G0)[1],dim(Down_topresults.C_g_G0)[1],
           dim(Down_topresults.C_F_g)[1])

p_gene <- cbind(UP_g,Down_g)
noms_barres <- c("G0 versus Fr", "G0 versus Ce", "Fr versus Ce")

pdf(file = "nombre de gènes différentiellement exprimés_col.Fr_G0_g.pdf",width = 10, height = 9, pointsize = 10)
g <- barplot(t(p_gene), beside=F, col=c("#84c28f", "#ac8a65"), las = 2, 
             horiz = F, ylab ="nombre de gènes différentiellement exprimés",
        main="Nombre de gènes différentiellement exprimés \n (pvalue ajustée <0,01 et log2foldchange 2%)",
        ylim=c(0,250), cex.lab=1.4, cex.main = 2) 
legend( x="topright", legend=c("gènes dont l'expression a augmenté","gènes dont l'expression a diminué"), 
        cex=2,fill=c("#84c28f", "#ac8a65"),bty="n")
text(g, par("usr")[3], labels = noms_barres, srt = 360, adj = c(0.5,2.1), 
     xpd = TRUE, cex=1.4)
dev.off()

## nombre de famille ET différentiellement exprimées par condition

UP_et <- c(dim(topresults.et_F_G0[topresults.et_F_G0$log2FoldChange> 2,])[1], 
           dim(topresults.et_C_G0[topresults.et_C_G0$log2FoldChange> 2,])[1],
           dim(topresults.et_C_F[topresults.et_C_F$log2FoldChange> 2,])[1])

Down_et <- c(dim(topresults.et_F_G0[topresults.et_F_G0$log2FoldChange< -2,])[1], 
           dim(topresults.et_C_G0[topresults.et_C_G0$log2FoldChange< -2,])[1],
           dim(topresults.et_C_F[topresults.et_C_F$log2FoldChange< -2,])[1])

p_ET <- cbind(UP_et,Down_et)
noms_barres <- c("G0 versus Fr", "G0 versus Ce", "Ce versus Fr")

pdf(file = "nombre de famille ET différentiellement exprimés_col.Fr_G0_g.pdf",width = 10, height = 9, pointsize = 10)
et <- barplot(t(p_ET), beside=F, col=c("#84c28f", "#ac8a65"),las = 2,  
              horiz = F, ylab ="Nombre de familles de ET différentiellement exprimées",
              main="Nombre de familles ET différentiellement exprimées \n (pvalue ajustée < 0,01 et log2foldchange <-2 ou >2)",
              ylim=c(0,25), cex.lab=1.4, cex.main = 2)
legend( x="topright", legend=c("familles d'ET dont l'expression a augmenté","familles d'ET dont l'expression a diminué"), 
         cex=2,fill=c("#84c28f", "#ac8a65"),bty="n")
text(et, par("usr")[3], labels = noms_barres, srt = 360, adj = c(0.5,2.1), 
     xpd = TRUE, cex=1.4)
dev.off()

## diagramme de Venn comparaison C_G0 et F_G0 pour les gènes

topresults.res_C_G0 <- res_C_g_G0[which(res_C_g_G0$padj < cutoff & (res_C_g_G0$log2FoldChange > 2 | 
                                                                      res_C_g_G0$log2FoldChange < -2)), ]
topresults.res_F_G0 <- res_F_g_G0[which(res_F_g_G0$padj < cutoff & (res_F_g_G0$log2FoldChange > 2 | 
                                                                      res_F_g_G0$log2FoldChange < -2)), ]

groupe <- list('G0 versus Fr' = rownames(topresults.res_F_G0), 
               'G0 versus Ce' = rownames(topresults.res_C_G0))

pdf(file = "diagramme de Venn comparaison C_G0 et F_G0 pour les gènes_col.pdf",width = 10, height = 10, pointsize = 10)
ggvenn(groupe,  c(A = 'G0 versus Fr', B = 'G0 versus Ce'), fill_color = c("#84c28f", "#ac8a65"),
       fill_alpha = 1, stroke_alpha = 0, set_name_size = 10, text_size = 9)
dev.off()

## diagramme de Venn comparaison C_G0 et F_G0 pour les ET

groupe <- list('G0 versus Fr' = rownames(topresults.et_F_G0), 
               'G0 versus Ce' = rownames(topresults.et_C_G0))

pdf(file = "diagramme de Venn comparaison C_G0 et F_G0 pour les ET_col.pdf",width = 10, height = 10, pointsize = 10)
ggvenn(groupe,  c(A = 'G0 versus Fr', B = 'G0 versus Ce'), fill_color = c("#84c28f", "#ac8a65"),
       fill_alpha = 1, stroke_alpha = 0, set_name_size = 10, text_size = 9)
dev.off()
