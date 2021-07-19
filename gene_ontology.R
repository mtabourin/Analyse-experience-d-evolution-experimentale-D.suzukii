
library(readODS)
library(AnnotationHub)
library(clusterProfiler)
library(ggplot2)

### Téléchargement des listes des ID des gènes d'intéret 

UP_topgenes.Fr_G0 <- read_ods(path = "UP_topgenes.ods", sheet = "UP_topgenes.F_G0", col_names = TRUE)
UP_topgenes.Fr_G0 <- UP_topgenes.Fr_G0$`ID FlyBase`
UP_topgenes.Fr_G0 <- UP_topgenes.Fr_G0[UP_topgenes.Fr_G0 != "#N/D"]

UP_topgenes.Ce_G0 <- read_ods(path = "UP_topgenes.ods", sheet = "UP_topgenes.C_G0", col_names = TRUE)
UP_topgenes.Ce_G0 <- UP_topgenes.Ce_G0$`ID FlyBase`
UP_topgenes.Ce_G0 <- UP_topgenes.Ce_G0[UP_topgenes.Ce_G0 != "#N/D"]

UP.Fr_G0.Ce_G0 <- read_ods(path = "UP_topgenes.ods", sheet = "UP_topgenes.F_G0", col_names = TRUE)
UP.Fr_G0.Ce_G0 <- UP.Fr_G0.Ce_G0 %>% filter(!is.na(UP.Fr_G0.Ce_G0$`Présence dans C_G0`))
UP.Fr_G0.Ce_G0 <- UP.Fr_G0.Ce_G0$`ID FlyBase`
UP.Fr_G0.Ce_G0 <- UP.Fr_G0.Ce_G0[UP.Fr_G0.Ce_G0 != "#N/D"]


### Téléchargement des ID des orthologues

ref_ID <- read.table("../ref_ID.txt")
ref_ID <- ref_ID$V1

### Téléchargement des ID de référence

hub <- AnnotationHub()
query(hub, "org.Dm")
Dmelano <- hub[["AH92580"]]

### Gene ontology

go_UP_Fr_G0 <- enrichGO(gene          = UP_topgenes.Fr_G0,
                        keyType       = 'FLYBASE',
                        universe      = ref_ID,
                        ont           = "ALL",
                        OrgDb         = Dmelano,
                        pAdjustMethod = "BH",
                        pvalueCutoff  = 0.05,
                        qvalueCutoff  = 0.5)

go_UP_Ce_G0 <- enrichGO(gene          = UP_topgenes.Ce_G0,
                        keyType       = 'FLYBASE',
                        universe      = ref_ID,
                        ont           = "ALL",
                        OrgDb         = Dmelano,
                        pAdjustMethod = "BH",
                        pvalueCutoff  = 0.05,
                        qvalueCutoff  = 0.5)


go_UP.Fr_G0.Ce_G0 <- enrichGO(gene          = UP.Fr_G0.Ce_G0,
                        keyType       = 'FLYBASE',
                        universe      = ref_ID,
                        ont           = "ALL",
                        OrgDb         = Dmelano,
                        pAdjustMethod = "BH",
                        pvalueCutoff  = 0.05,
                        qvalueCutoff  = 0.5)

### Visualisation

pdf(file = "UP_topgenes.Fr_G0_g.pdf",width = 20, height = 10, pointsize = 10)
dotplot(go_UP_Fr_G0, split="ONTOLOGY", title="Enrichissement des termes GO pour les gènes surexprimés en Fr par rapport à G0") + facet_grid(ONTOLOGY~., scale="free")
dev.off()

pdf(file = "UP_topgenes.Ce_G0_g.pdf",width = 20, height = 10, pointsize = 10)
dotplot(go_UP_Ce_G0, split="ONTOLOGY", title="Enrichissement des termes GO pour les gènes surexprimés en Ce par rapport à G0") + facet_grid(ONTOLOGY~., scale="free")
dev.off()

pdf(file = "UP.Fr_G0.Ce_G0_g.pdf",width = 20, height = 10, pointsize = 10)
dotplot(go_UP.Fr_G0.Ce_G0, split="ONTOLOGY", title="Enrichissement des termes GO pour les gènes surexprimés en Fr et Ce par rapport à G0",font.size = 30) + facet_grid(ONTOLOGY~., scale="free")
dev.off()




