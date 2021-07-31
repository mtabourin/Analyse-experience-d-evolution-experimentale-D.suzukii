
library(tidyverse)

table <- read.table("variants_PLI.table",header = T, sep = "\t")

############### Comptage du nombre de variants par echantillon #################

# Pour Ce1_1
nbCe1_1 = 0
for ( vr in table$Ce1_1.AD) {
  
  i = dim(str_split(vr, ",", simplify = TRUE))[2]
  pass = "False"
  
  while (pass == "False") {
    if ((str_split(vr, ",", simplify = TRUE)[i]) > 0){
      nbCe1_1 = nbCe1_1 + 1
      pass = "True"
    }
    i = i - 1 
    
    if (i == 1) {
      pass = "True"
    }
    }
}
nbCe1_1
# On trouve 355 110 variants

# Pour Ce1_2
nbCe1_2 = 0
for ( vr in table$Ce1_2.AD) {
  
  i = dim(str_split(vr, ",", simplify = TRUE))[2]
  pass = "False"
  
  while (pass == "False") {
    if ((str_split(vr, ",", simplify = TRUE)[i]) > 0){
      nbCe1_2 = nbCe1_2 + 1
      pass = "True"
    }
    i = i - 1 
    
    if (i == 1) {
      pass = "True"
    }
  }
}
nbCe1_2
# On trouve 380 202 variants

# Pour Ce3_1
nbCe3_1 = 0
for ( vr in table$Ce3_1.AD) {
  
  i = dim(str_split(vr, ",", simplify = TRUE))[2]
  pass = "False"
  
  while (pass == "False") {
    if ((str_split(vr, ",", simplify = TRUE)[i]) > 0){
      nbCe3_1 = nbCe3_1 + 1
      pass = "True"
    }
    i = i - 1 
    
    if (i == 1) {
      pass = "True"
    }
  }
}
nbCe3_1
# On trouve 378 825 variants

# Pour Ce3_2
nbCe3_2 = 0
for ( vr in table$Ce3_2.AD) {
  
  i = dim(str_split(vr, ",", simplify = TRUE))[2]
  pass = "False"
  
  while (pass == "False") {
    if ((str_split(vr, ",", simplify = TRUE)[i]) > 0){
      nbCe3_2 = nbCe3_2 + 1
      pass = "True"
    }
    i = i - 1 
    
    if (i == 1) {
      pass = "True"
    }
  }
}
nbCe3_2
# On trouve 378 528 variants

# Pour Fr1_1
nbFr1_1 = 0
for ( vr in table$Fr1_1.AD) {
  
  i = dim(str_split(vr, ",", simplify = TRUE))[2]
  pass = "False"
  
  while (pass == "False") {
    if ((str_split(vr, ",", simplify = TRUE)[i]) > 0){
      nbFr1_1 = nbFr1_1 + 1
      pass = "True"
    }
    i = i - 1 
    
    if (i == 1) {
      pass = "True"
    }
  }
}
nbFr1_1
# On trouve 395 313 variants

# Pour Fr1_2
nbFr1_2 = 0
for ( vr in table$Fr1_2.AD) {
  
  i = dim(str_split(vr, ",", simplify = TRUE))[2]
  pass = "False"
  
  while (pass == "False") {
    if ((str_split(vr, ",", simplify = TRUE)[i]) > 0){
      nbFr1_2 = nbFr1_2 + 1
      pass = "True"
    }
    i = i - 1 
    
    if (i == 1) {
      pass = "True"
    }
  }
}
nbFr1_2
# On trouve 412 785 variants

# Pour Fr3_1
nbFr3_1 = 0
for ( vr in table$Fr3_1.AD) {
  
  i = dim(str_split(vr, ",", simplify = TRUE))[2]
  pass = "False"
  
  while (pass == "False") {
    if ((str_split(vr, ",", simplify = TRUE)[i]) > 0){
      nbFr3_1 = nbFr3_1 + 1
      pass = "True"
    }
    i = i - 1 
    
    if (i == 1) {
      pass = "True"
    }
  }
}
nbFr3_1
# On trouve 399 259 variants

# Pour Fr3_2
nbFr3_2 = 0
for ( vr in table$Fr3_2.AD) {
  
  i = dim(str_split(vr, ",", simplify = TRUE))[2]
  pass = "False"
  
  while (pass == "False") {
    if ((str_split(vr, ",", simplify = TRUE)[i]) > 0){
      nbFr3_2 = nbFr3_2 + 1
      pass = "True"
    }
    i = i - 1 
    
    if (i == 1) {
      pass = "True"
    }
  }
}
nbFr3_2
# On trouve 393 195 variants

# Pour G0_1
nbG0_1 = 0
for ( vr in table$G0_1.AD) {
  
  i = dim(str_split(vr, ",", simplify = TRUE))[2]
  pass = "False"
  
  while (pass == "False") {
    if ((str_split(vr, ",", simplify = TRUE)[i]) > 0){
      nbG0_1 = nbG0_1 + 1
      pass = "True"
    }
    i = i - 1 
    
    if (i == 1) {
      pass = "True"
    }
  }
}
nbG0_1
# On trouve 368 686 variants

# Pour G0_2
nbG0_2 = 0
for ( vr in table$G0_2.AD) {
  
  i = dim(str_split(vr, ",", simplify = TRUE))[2]
  pass = "False"
  
  while (pass == "False") {
    if ((str_split(vr, ",", simplify = TRUE)[i]) > 0){
      nbG0_2 = nbG0_2 + 1
      pass = "True"
    }
    i = i - 1 
    
    if (i == 1) {
      pass = "True"
    }
  }
}
nbG0_2
# On trouve 371 209 variants

# Visualisation

x <- c(368686, 371209, 395313, 412785, 399259, 393195, 355110, 380202, 378825, 378528)

noms_barres <- c("G0_1","G0_2","Fr1_1","Fr1_2", "Fr3_1", "Fr3_2", "Ce1_1", "Ce1_2", "Ce3_1", "Ce3_2")

pdf(file = "Nombre de variants par échantillon",width = 10, height = 9, pointsize = 10)
barplot(x,col=c("#FE2E2E","#FE2E2E","#FE9A2E", "#FE9A2E", "#FE9A2E", "#FE9A2E",
                "#F7FE2E", "#F7FE2E", "#F7FE2E", "#F7FE2E"), cex.lab=1.4, cex.main = 2,
        names.arg=noms_barres, ylab="nombre de variants",
        main="Nombre de variants par échantillon")
dev.off()

######## Comptage du nombre de positions hétérozygotes par échantillon #########

# Pour Ce1_1
nbHCe1_1 = 0
for ( vr in table$Ce1_1.PL) {
  if (dim(str_split(vr, ",", simplify = TRUE))[2] == 3) {
    if ((str_split(vr, ",", simplify = TRUE)[2]) == 0 && (str_split(vr, ",", simplify = TRUE)[1]) != 0 ){
      nbHCe1_1 = nbHCe1_1 + 1
    }
  }
  else if (dim(str_split(vr, ",", simplify = TRUE))[2] == 6) {
    if ((str_split(vr, ",", simplify = TRUE)[1]) != 0 && (str_split(vr, ",", simplify = TRUE)[3]) != 0 && 
        (str_split(vr, ",", simplify = TRUE)[6]) != 0){
      nbHCe1_1 = nbHCe1_1 + 1
    } 
  }
  else if (dim(str_split(vr, ",", simplify = TRUE))[2] == 10) {
    if ((str_split(vr, ",", simplify = TRUE)[1]) != 0 && (str_split(vr, ",", simplify = TRUE)[3]) != 0 && 
        (str_split(vr, ",", simplify = TRUE)[6]) != 0 && (str_split(vr, ",", simplify = TRUE)[10]) != 0){
      nbHCe1_1 = nbHCe1_1 + 1
    }
  }
  else if (dim(str_split(vr, ",", simplify = TRUE))[2] == 15) {
    if ((str_split(vr, ",", simplify = TRUE)[1]) != 0 && (str_split(vr, ",", simplify = TRUE)[3]) != 0 && 
        (str_split(vr, ",", simplify = TRUE)[6]) != 0 && (str_split(vr, ",", simplify = TRUE)[10]) != 0 &&
        (str_split(vr, ",", simplify = TRUE)[15]) != 0){
      nbHCe1_1 = nbHCe1_1 + 1
    }
  }
  else if (dim(str_split(vr, ",", simplify = TRUE))[2] == 21) {
    if ((str_split(vr, ",", simplify = TRUE)[1]) != 0 && (str_split(vr, ",", simplify = TRUE)[3]) != 0 && 
        (str_split(vr, ",", simplify = TRUE)[6]) != 0 && (str_split(vr, ",", simplify = TRUE)[10]) != 0 &&
        (str_split(vr, ",", simplify = TRUE)[15]) != 0 && (str_split(vr, ",", simplify = TRUE)[21]) != 0){
        nbHCe1_1 = nbHCe1_1 + 1
    }
  }
  else if (dim(str_split(vr, ",", simplify = TRUE))[2] == 28) {
    if ((str_split(vr, ",", simplify = TRUE)[1]) != 0 && (str_split(vr, ",", simplify = TRUE)[3]) != 0 && 
        (str_split(vr, ",", simplify = TRUE)[6]) != 0 && (str_split(vr, ",", simplify = TRUE)[10]) != 0 &&
        (str_split(vr, ",", simplify = TRUE)[15]) != 0 && (str_split(vr, ",", simplify = TRUE)[21]) != 0 
        && (str_split(vr, ",", simplify = TRUE)[28]) != 0){
      nbHCe1_1 = nbHCe1_1 + 1
    }
  }
}
nbHCe1_1
# On trouve 265 772 positions hétérozygotes


# Pour Ce1_2
nbHCe1_2 = 0
for ( vr in table$Ce1_2.PL) {
  if (dim(str_split(vr, ",", simplify = TRUE))[2] == 3) {
    if ((str_split(vr, ",", simplify = TRUE)[2]) == 0 && (str_split(vr, ",", simplify = TRUE)[1]) != 0 ){
      nbHCe1_2 = nbHCe1_2 + 1
    }
  }
  else if (dim(str_split(vr, ",", simplify = TRUE))[2] == 6) {
    if ((str_split(vr, ",", simplify = TRUE)[1]) != 0 && (str_split(vr, ",", simplify = TRUE)[3]) != 0 && 
        (str_split(vr, ",", simplify = TRUE)[6]) != 0){
      nbHCe1_2 = nbHCe1_2 + 1
    } 
  }
  else if (dim(str_split(vr, ",", simplify = TRUE))[2] == 10) {
    if ((str_split(vr, ",", simplify = TRUE)[1]) != 0 && (str_split(vr, ",", simplify = TRUE)[3]) != 0 && 
        (str_split(vr, ",", simplify = TRUE)[6]) != 0 && (str_split(vr, ",", simplify = TRUE)[10]) != 0){
      nbHCe1_2 = nbHCe1_2 + 1
    }
  }
  else if (dim(str_split(vr, ",", simplify = TRUE))[2] == 15) {
    if ((str_split(vr, ",", simplify = TRUE)[1]) != 0 && (str_split(vr, ",", simplify = TRUE)[3]) != 0 && 
        (str_split(vr, ",", simplify = TRUE)[6]) != 0 && (str_split(vr, ",", simplify = TRUE)[10]) != 0 &&
        (str_split(vr, ",", simplify = TRUE)[15]) != 0){
      nbHCe1_2 = nbHCe1_2 + 1
    }
  }
  else if (dim(str_split(vr, ",", simplify = TRUE))[2] == 21) {
    if ((str_split(vr, ",", simplify = TRUE)[1]) != 0 && (str_split(vr, ",", simplify = TRUE)[3]) != 0 && 
        (str_split(vr, ",", simplify = TRUE)[6]) != 0 && (str_split(vr, ",", simplify = TRUE)[10]) != 0 &&
        (str_split(vr, ",", simplify = TRUE)[15]) != 0 && (str_split(vr, ",", simplify = TRUE)[21]) != 0){
      nbHCe1_2 = nbHCe1_2 + 1
    }
  }
  else if (dim(str_split(vr, ",", simplify = TRUE))[2] == 28) {
    if ((str_split(vr, ",", simplify = TRUE)[1]) != 0 && (str_split(vr, ",", simplify = TRUE)[3]) != 0 && 
        (str_split(vr, ",", simplify = TRUE)[6]) != 0 && (str_split(vr, ",", simplify = TRUE)[10]) != 0 &&
        (str_split(vr, ",", simplify = TRUE)[15]) != 0 && (str_split(vr, ",", simplify = TRUE)[21]) != 0 
        && (str_split(vr, ",", simplify = TRUE)[28]) != 0){
      nbHCe1_2 = nbHCe1_2 + 1
    }
  }
}
nbHCe1_2
# On trouve 285 655 positions hétérozygotes

# Pour Ce3_1
nbHCe3_1 = 0
for ( vr in table$Ce3_1.PL) {
  if (dim(str_split(vr, ",", simplify = TRUE))[2] == 3) {
    if ((str_split(vr, ",", simplify = TRUE)[2]) == 0 && (str_split(vr, ",", simplify = TRUE)[1]) != 0 ){
      nbHCe3_1 = nbHCe3_1 + 1
    }
  }
  else if (dim(str_split(vr, ",", simplify = TRUE))[2] == 6) {
    if ((str_split(vr, ",", simplify = TRUE)[1]) != 0 && (str_split(vr, ",", simplify = TRUE)[3]) != 0 && 
        (str_split(vr, ",", simplify = TRUE)[6]) != 0){
      nbHCe3_1 = nbHCe3_1 + 1
    } 
  }
  else if (dim(str_split(vr, ",", simplify = TRUE))[2] == 10) {
    if ((str_split(vr, ",", simplify = TRUE)[1]) != 0 && (str_split(vr, ",", simplify = TRUE)[3]) != 0 && 
        (str_split(vr, ",", simplify = TRUE)[6]) != 0 && (str_split(vr, ",", simplify = TRUE)[10]) != 0){
      nbHCe3_1 = nbHCe3_1 + 1
    }
  }
  else if (dim(str_split(vr, ",", simplify = TRUE))[2] == 15) {
    if ((str_split(vr, ",", simplify = TRUE)[1]) != 0 && (str_split(vr, ",", simplify = TRUE)[3]) != 0 && 
        (str_split(vr, ",", simplify = TRUE)[6]) != 0 && (str_split(vr, ",", simplify = TRUE)[10]) != 0 &&
        (str_split(vr, ",", simplify = TRUE)[15]) != 0){
      nbHCe3_1 = nbHCe3_1 + 1
    }
  }
  else if (dim(str_split(vr, ",", simplify = TRUE))[2] == 21) {
    if ((str_split(vr, ",", simplify = TRUE)[1]) != 0 && (str_split(vr, ",", simplify = TRUE)[3]) != 0 && 
        (str_split(vr, ",", simplify = TRUE)[6]) != 0 && (str_split(vr, ",", simplify = TRUE)[10]) != 0 &&
        (str_split(vr, ",", simplify = TRUE)[15]) != 0 && (str_split(vr, ",", simplify = TRUE)[21]) != 0){
      nbHCe3_1 = nbHCe3_1 + 1
    }
  }
  else if (dim(str_split(vr, ",", simplify = TRUE))[2] == 28) {
    if ((str_split(vr, ",", simplify = TRUE)[1]) != 0 && (str_split(vr, ",", simplify = TRUE)[3]) != 0 && 
        (str_split(vr, ",", simplify = TRUE)[6]) != 0 && (str_split(vr, ",", simplify = TRUE)[10]) != 0 &&
        (str_split(vr, ",", simplify = TRUE)[15]) != 0 && (str_split(vr, ",", simplify = TRUE)[21]) != 0 
        && (str_split(vr, ",", simplify = TRUE)[28]) != 0){
      nbHCe3_1 = nbHCe3_1 + 1
    }
  }
}
nbHCe3_1
# On trouve 283 308 positions hétérozygotes

# Pour Ce3_2
nbHCe3_2 = 0
for ( vr in table$Ce3_2.PL) {
  if (dim(str_split(vr, ",", simplify = TRUE))[2] == 3) {
    if ((str_split(vr, ",", simplify = TRUE)[2]) == 0 && (str_split(vr, ",", simplify = TRUE)[1]) != 0 ){
      nbHCe3_2 = nbHCe3_2 + 1
    }
  }
  else if (dim(str_split(vr, ",", simplify = TRUE))[2] == 6) {
    if ((str_split(vr, ",", simplify = TRUE)[1]) != 0 && (str_split(vr, ",", simplify = TRUE)[3]) != 0 && 
        (str_split(vr, ",", simplify = TRUE)[6]) != 0){
      nbHCe3_2 = nbHCe3_2 + 1
    } 
  }
  else if (dim(str_split(vr, ",", simplify = TRUE))[2] == 10) {
    if ((str_split(vr, ",", simplify = TRUE)[1]) != 0 && (str_split(vr, ",", simplify = TRUE)[3]) != 0 && 
        (str_split(vr, ",", simplify = TRUE)[6]) != 0 && (str_split(vr, ",", simplify = TRUE)[10]) != 0){
      nbHCe3_2 = nbHCe3_2 + 1
    }
  }
  else if (dim(str_split(vr, ",", simplify = TRUE))[2] == 15) {
    if ((str_split(vr, ",", simplify = TRUE)[1]) != 0 && (str_split(vr, ",", simplify = TRUE)[3]) != 0 && 
        (str_split(vr, ",", simplify = TRUE)[6]) != 0 && (str_split(vr, ",", simplify = TRUE)[10]) != 0 &&
        (str_split(vr, ",", simplify = TRUE)[15]) != 0){
      nbHCe3_2 = nbHCe3_2 + 1
    }
  }
  else if (dim(str_split(vr, ",", simplify = TRUE))[2] == 21) {
    if ((str_split(vr, ",", simplify = TRUE)[1]) != 0 && (str_split(vr, ",", simplify = TRUE)[3]) != 0 && 
        (str_split(vr, ",", simplify = TRUE)[6]) != 0 && (str_split(vr, ",", simplify = TRUE)[10]) != 0 &&
        (str_split(vr, ",", simplify = TRUE)[15]) != 0 && (str_split(vr, ",", simplify = TRUE)[21]) != 0){
      nbHCe3_2 = nbHCe3_2 + 1
    }
  }
  else if (dim(str_split(vr, ",", simplify = TRUE))[2] == 28) {
    if ((str_split(vr, ",", simplify = TRUE)[1]) != 0 && (str_split(vr, ",", simplify = TRUE)[3]) != 0 && 
        (str_split(vr, ",", simplify = TRUE)[6]) != 0 && (str_split(vr, ",", simplify = TRUE)[10]) != 0 &&
        (str_split(vr, ",", simplify = TRUE)[15]) != 0 && (str_split(vr, ",", simplify = TRUE)[21]) != 0 
        && (str_split(vr, ",", simplify = TRUE)[28]) != 0){
      nbHCe3_2 = nbHCe3_2 + 1
    }
  }
}
nbHCe3_2
# On trouve 284 408 positions hétérozygotes

# Pour Fr1_1
nbHFr1_1 = 0
for ( vr in table$Fr1_1.PL) {
  if (dim(str_split(vr, ",", simplify = TRUE))[2] == 3) {
    if ((str_split(vr, ",", simplify = TRUE)[2]) == 0 && (str_split(vr, ",", simplify = TRUE)[1]) != 0 ){
      nbHFr1_1 = nbHFr1_1 + 1
    }
  }
  else if (dim(str_split(vr, ",", simplify = TRUE))[2] == 6) {
    if ((str_split(vr, ",", simplify = TRUE)[1]) != 0 && (str_split(vr, ",", simplify = TRUE)[3]) != 0 && 
        (str_split(vr, ",", simplify = TRUE)[6]) != 0){
      nbHFr1_1 = nbHFr1_1 + 1
    } 
  }
  else if (dim(str_split(vr, ",", simplify = TRUE))[2] == 10) {
    if ((str_split(vr, ",", simplify = TRUE)[1]) != 0 && (str_split(vr, ",", simplify = TRUE)[3]) != 0 && 
        (str_split(vr, ",", simplify = TRUE)[6]) != 0 && (str_split(vr, ",", simplify = TRUE)[10]) != 0){
      nbHFr1_1 = nbHFr1_1 + 1
    }
  }
  else if (dim(str_split(vr, ",", simplify = TRUE))[2] == 15) {
    if ((str_split(vr, ",", simplify = TRUE)[1]) != 0 && (str_split(vr, ",", simplify = TRUE)[3]) != 0 && 
        (str_split(vr, ",", simplify = TRUE)[6]) != 0 && (str_split(vr, ",", simplify = TRUE)[10]) != 0 &&
        (str_split(vr, ",", simplify = TRUE)[15]) != 0){
      nbHFr1_1 = nbHFr1_1 + 1
    }
  }
  else if (dim(str_split(vr, ",", simplify = TRUE))[2] == 21) {
    if ((str_split(vr, ",", simplify = TRUE)[1]) != 0 && (str_split(vr, ",", simplify = TRUE)[3]) != 0 && 
        (str_split(vr, ",", simplify = TRUE)[6]) != 0 && (str_split(vr, ",", simplify = TRUE)[10]) != 0 &&
        (str_split(vr, ",", simplify = TRUE)[15]) != 0 && (str_split(vr, ",", simplify = TRUE)[21]) != 0){
      nbHFr1_1 = nbHFr1_1 + 1
    }
  }
  else if (dim(str_split(vr, ",", simplify = TRUE))[2] == 28) {
    if ((str_split(vr, ",", simplify = TRUE)[1]) != 0 && (str_split(vr, ",", simplify = TRUE)[3]) != 0 && 
        (str_split(vr, ",", simplify = TRUE)[6]) != 0 && (str_split(vr, ",", simplify = TRUE)[10]) != 0 &&
        (str_split(vr, ",", simplify = TRUE)[15]) != 0 && (str_split(vr, ",", simplify = TRUE)[21]) != 0 
        && (str_split(vr, ",", simplify = TRUE)[28]) != 0){
      nbHFr1_1 = nbHFr1_1 + 1
    }
  }
}
nbHFr1_1
# On trouve 302 654 positions hétérozygotes

# Pour Fr1_2
nbHFr1_2 = 0
for ( vr in table$Fr1_2.PL) {
  if (dim(str_split(vr, ",", simplify = TRUE))[2] == 3) {
    if ((str_split(vr, ",", simplify = TRUE)[2]) == 0 && (str_split(vr, ",", simplify = TRUE)[1]) != 0 ){
      nbHFr1_2 = nbHFr1_2 + 1
    }
  }
  else if (dim(str_split(vr, ",", simplify = TRUE))[2] == 6) {
    if ((str_split(vr, ",", simplify = TRUE)[1]) != 0 && (str_split(vr, ",", simplify = TRUE)[3]) != 0 && 
        (str_split(vr, ",", simplify = TRUE)[6]) != 0){
      nbHFr1_2 = nbHFr1_2 + 1
    } 
  }
  else if (dim(str_split(vr, ",", simplify = TRUE))[2] == 10) {
    if ((str_split(vr, ",", simplify = TRUE)[1]) != 0 && (str_split(vr, ",", simplify = TRUE)[3]) != 0 && 
        (str_split(vr, ",", simplify = TRUE)[6]) != 0 && (str_split(vr, ",", simplify = TRUE)[10]) != 0){
      nbHFr1_2 = nbHFr1_2 + 1
    }
  }
  else if (dim(str_split(vr, ",", simplify = TRUE))[2] == 15) {
    if ((str_split(vr, ",", simplify = TRUE)[1]) != 0 && (str_split(vr, ",", simplify = TRUE)[3]) != 0 && 
        (str_split(vr, ",", simplify = TRUE)[6]) != 0 && (str_split(vr, ",", simplify = TRUE)[10]) != 0 &&
        (str_split(vr, ",", simplify = TRUE)[15]) != 0){
      nbHFr1_2 = nbHFr1_2 + 1
    }
  }
  else if (dim(str_split(vr, ",", simplify = TRUE))[2] == 21) {
    if ((str_split(vr, ",", simplify = TRUE)[1]) != 0 && (str_split(vr, ",", simplify = TRUE)[3]) != 0 && 
        (str_split(vr, ",", simplify = TRUE)[6]) != 0 && (str_split(vr, ",", simplify = TRUE)[10]) != 0 &&
        (str_split(vr, ",", simplify = TRUE)[15]) != 0 && (str_split(vr, ",", simplify = TRUE)[21]) != 0){
      nbHFr1_2 = nbHFr1_2 + 1
    }
  }
  else if (dim(str_split(vr, ",", simplify = TRUE))[2] == 28) {
    if ((str_split(vr, ",", simplify = TRUE)[1]) != 0 && (str_split(vr, ",", simplify = TRUE)[3]) != 0 && 
        (str_split(vr, ",", simplify = TRUE)[6]) != 0 && (str_split(vr, ",", simplify = TRUE)[10]) != 0 &&
        (str_split(vr, ",", simplify = TRUE)[15]) != 0 && (str_split(vr, ",", simplify = TRUE)[21]) != 0 
        && (str_split(vr, ",", simplify = TRUE)[28]) != 0){
      nbHFr1_2 = nbHFr1_2 + 1
    }
  }
}
nbHFr1_2
# On trouve 319 539 positions hétérozygotes

# Pour Fr3_1
nbHFr3_1 = 0
for ( vr in table$Fr3_1.PL) {
  if (dim(str_split(vr, ",", simplify = TRUE))[2] == 3) {
    if ((str_split(vr, ",", simplify = TRUE)[2]) == 0 && (str_split(vr, ",", simplify = TRUE)[1]) != 0 ){
      nbHFr3_1 = nbHFr3_1 + 1
    }
  }
  else if (dim(str_split(vr, ",", simplify = TRUE))[2] == 6) {
    if ((str_split(vr, ",", simplify = TRUE)[1]) != 0 && (str_split(vr, ",", simplify = TRUE)[3]) != 0 && 
        (str_split(vr, ",", simplify = TRUE)[6]) != 0){
      nbHFr3_1 = nbHFr3_1 + 1
    } 
  }
  else if (dim(str_split(vr, ",", simplify = TRUE))[2] == 10) {
    if ((str_split(vr, ",", simplify = TRUE)[1]) != 0 && (str_split(vr, ",", simplify = TRUE)[3]) != 0 && 
        (str_split(vr, ",", simplify = TRUE)[6]) != 0 && (str_split(vr, ",", simplify = TRUE)[10]) != 0){
      nbHFr3_1 = nbHFr3_1 + 1
    }
  }
  else if (dim(str_split(vr, ",", simplify = TRUE))[2] == 15) {
    if ((str_split(vr, ",", simplify = TRUE)[1]) != 0 && (str_split(vr, ",", simplify = TRUE)[3]) != 0 && 
        (str_split(vr, ",", simplify = TRUE)[6]) != 0 && (str_split(vr, ",", simplify = TRUE)[10]) != 0 &&
        (str_split(vr, ",", simplify = TRUE)[15]) != 0){
      nbHFr3_1 = nbHFr3_1 + 1
    }
  }
  else if (dim(str_split(vr, ",", simplify = TRUE))[2] == 21) {
    if ((str_split(vr, ",", simplify = TRUE)[1]) != 0 && (str_split(vr, ",", simplify = TRUE)[3]) != 0 && 
        (str_split(vr, ",", simplify = TRUE)[6]) != 0 && (str_split(vr, ",", simplify = TRUE)[10]) != 0 &&
        (str_split(vr, ",", simplify = TRUE)[15]) != 0 && (str_split(vr, ",", simplify = TRUE)[21]) != 0){
      nbHFr3_1 = nbHFr3_1 + 1
    }
  }
  else if (dim(str_split(vr, ",", simplify = TRUE))[2] == 28) {
    if ((str_split(vr, ",", simplify = TRUE)[1]) != 0 && (str_split(vr, ",", simplify = TRUE)[3]) != 0 && 
        (str_split(vr, ",", simplify = TRUE)[6]) != 0 && (str_split(vr, ",", simplify = TRUE)[10]) != 0 &&
        (str_split(vr, ",", simplify = TRUE)[15]) != 0 && (str_split(vr, ",", simplify = TRUE)[21]) != 0 
        && (str_split(vr, ",", simplify = TRUE)[28]) != 0){
      nbHFr3_1 = nbHFr3_1 + 1
    }
  }
}
nbHFr3_1
# On trouve 309 942 positions hétérozygotes

# Pour Fr3_2
nbHFr3_2 = 0
for ( vr in table$Fr3_2.PL) {
  if (dim(str_split(vr, ",", simplify = TRUE))[2] == 3) {
    if ((str_split(vr, ",", simplify = TRUE)[2]) == 0 && (str_split(vr, ",", simplify = TRUE)[1]) != 0 ){
      nbHFr3_2 = nbHFr3_2 + 1
    }
  }
  else if (dim(str_split(vr, ",", simplify = TRUE))[2] == 6) {
    if ((str_split(vr, ",", simplify = TRUE)[1]) != 0 && (str_split(vr, ",", simplify = TRUE)[3]) != 0 && 
        (str_split(vr, ",", simplify = TRUE)[6]) != 0){
      nbHFr3_2 = nbHFr3_2 + 1
    } 
  }
  else if (dim(str_split(vr, ",", simplify = TRUE))[2] == 10) {
    if ((str_split(vr, ",", simplify = TRUE)[1]) != 0 && (str_split(vr, ",", simplify = TRUE)[3]) != 0 && 
        (str_split(vr, ",", simplify = TRUE)[6]) != 0 && (str_split(vr, ",", simplify = TRUE)[10]) != 0){
      nbHFr3_2 = nbHFr3_2 + 1
    }
  }
  else if (dim(str_split(vr, ",", simplify = TRUE))[2] == 15) {
    if ((str_split(vr, ",", simplify = TRUE)[1]) != 0 && (str_split(vr, ",", simplify = TRUE)[3]) != 0 && 
        (str_split(vr, ",", simplify = TRUE)[6]) != 0 && (str_split(vr, ",", simplify = TRUE)[10]) != 0 &&
        (str_split(vr, ",", simplify = TRUE)[15]) != 0){
      nbHFr3_2 = nbHFr3_2 + 1
    }
  }
  else if (dim(str_split(vr, ",", simplify = TRUE))[2] == 21) {
    if ((str_split(vr, ",", simplify = TRUE)[1]) != 0 && (str_split(vr, ",", simplify = TRUE)[3]) != 0 && 
        (str_split(vr, ",", simplify = TRUE)[6]) != 0 && (str_split(vr, ",", simplify = TRUE)[10]) != 0 &&
        (str_split(vr, ",", simplify = TRUE)[15]) != 0 && (str_split(vr, ",", simplify = TRUE)[21]) != 0){
      nbHFr3_2 = nbHFr3_2 + 1
    }
  }
  else if (dim(str_split(vr, ",", simplify = TRUE))[2] == 28) {
    if ((str_split(vr, ",", simplify = TRUE)[1]) != 0 && (str_split(vr, ",", simplify = TRUE)[3]) != 0 && 
        (str_split(vr, ",", simplify = TRUE)[6]) != 0 && (str_split(vr, ",", simplify = TRUE)[10]) != 0 &&
        (str_split(vr, ",", simplify = TRUE)[15]) != 0 && (str_split(vr, ",", simplify = TRUE)[21]) != 0 
        && (str_split(vr, ",", simplify = TRUE)[28]) != 0){
      nbHFr3_2 = nbHFr3_2 + 1
    }
  }
}
nbHFr3_2
# On trouve 293 342 positions hétérozygotes

# Pour G0_1
nbHG0_1 = 0
for ( vr in table$G0_1.PL) {
  if (dim(str_split(vr, ",", simplify = TRUE))[2] == 3) {
    if ((str_split(vr, ",", simplify = TRUE)[2]) == 0 && (str_split(vr, ",", simplify = TRUE)[1]) != 0 ){
      nbHG0_1 = nbHG0_1 + 1
    }
  }
  else if (dim(str_split(vr, ",", simplify = TRUE))[2] == 6) {
    if ((str_split(vr, ",", simplify = TRUE)[1]) != 0 && (str_split(vr, ",", simplify = TRUE)[3]) != 0 && 
        (str_split(vr, ",", simplify = TRUE)[6]) != 0){
      nbHG0_1 = nbHG0_1 + 1
    } 
  }
  else if (dim(str_split(vr, ",", simplify = TRUE))[2] == 10) {
    if ((str_split(vr, ",", simplify = TRUE)[1]) != 0 && (str_split(vr, ",", simplify = TRUE)[3]) != 0 && 
        (str_split(vr, ",", simplify = TRUE)[6]) != 0 && (str_split(vr, ",", simplify = TRUE)[10]) != 0){
      nbHG0_1 = nbHG0_1 + 1
    }
  }
  else if (dim(str_split(vr, ",", simplify = TRUE))[2] == 15) {
    if ((str_split(vr, ",", simplify = TRUE)[1]) != 0 && (str_split(vr, ",", simplify = TRUE)[3]) != 0 && 
        (str_split(vr, ",", simplify = TRUE)[6]) != 0 && (str_split(vr, ",", simplify = TRUE)[10]) != 0 &&
        (str_split(vr, ",", simplify = TRUE)[15]) != 0){
      nbHG0_1 = nbHG0_1 + 1
    }
  }
  else if (dim(str_split(vr, ",", simplify = TRUE))[2] == 21) {
    if ((str_split(vr, ",", simplify = TRUE)[1]) != 0 && (str_split(vr, ",", simplify = TRUE)[3]) != 0 && 
        (str_split(vr, ",", simplify = TRUE)[6]) != 0 && (str_split(vr, ",", simplify = TRUE)[10]) != 0 &&
        (str_split(vr, ",", simplify = TRUE)[15]) != 0 && (str_split(vr, ",", simplify = TRUE)[21]) != 0){
      nbHG0_1 = nbHG0_1 + 1
    }
  }
  else if (dim(str_split(vr, ",", simplify = TRUE))[2] == 28) {
    if ((str_split(vr, ",", simplify = TRUE)[1]) != 0 && (str_split(vr, ",", simplify = TRUE)[3]) != 0 && 
        (str_split(vr, ",", simplify = TRUE)[6]) != 0 && (str_split(vr, ",", simplify = TRUE)[10]) != 0 &&
        (str_split(vr, ",", simplify = TRUE)[15]) != 0 && (str_split(vr, ",", simplify = TRUE)[21]) != 0 
        && (str_split(vr, ",", simplify = TRUE)[28]) != 0){
      nbHG0_1 = nbHG0_1 + 1
    }
  }
}
nbHG0_1
# On trouve 293 620 positions hétérozygotes

# Pour G0_2
nbHG0_2 = 0
for ( vr in table$G0_2.PL) {
  if (dim(str_split(vr, ",", simplify = TRUE))[2] == 3) {
    if ((str_split(vr, ",", simplify = TRUE)[2]) == 0 && (str_split(vr, ",", simplify = TRUE)[1]) != 0 ){
      nbHG0_2 = nbHG0_2 + 1
    }
  }
  else if (dim(str_split(vr, ",", simplify = TRUE))[2] == 6) {
    if ((str_split(vr, ",", simplify = TRUE)[1]) != 0 && (str_split(vr, ",", simplify = TRUE)[3]) != 0 && 
        (str_split(vr, ",", simplify = TRUE)[6]) != 0){
      nbHG0_2 = nbHG0_2 + 1
    } 
  }
  else if (dim(str_split(vr, ",", simplify = TRUE))[2] == 10) {
    if ((str_split(vr, ",", simplify = TRUE)[1]) != 0 && (str_split(vr, ",", simplify = TRUE)[3]) != 0 && 
        (str_split(vr, ",", simplify = TRUE)[6]) != 0 && (str_split(vr, ",", simplify = TRUE)[10]) != 0){
      nbHG0_2 = nbHG0_2 + 1
    }
  }
  else if (dim(str_split(vr, ",", simplify = TRUE))[2] == 15) {
    if ((str_split(vr, ",", simplify = TRUE)[1]) != 0 && (str_split(vr, ",", simplify = TRUE)[3]) != 0 && 
        (str_split(vr, ",", simplify = TRUE)[6]) != 0 && (str_split(vr, ",", simplify = TRUE)[10]) != 0 &&
        (str_split(vr, ",", simplify = TRUE)[15]) != 0){
      nbHG0_2 = nbHG0_2 + 1
    }
  }
  else if (dim(str_split(vr, ",", simplify = TRUE))[2] == 21) {
    if ((str_split(vr, ",", simplify = TRUE)[1]) != 0 && (str_split(vr, ",", simplify = TRUE)[3]) != 0 && 
        (str_split(vr, ",", simplify = TRUE)[6]) != 0 && (str_split(vr, ",", simplify = TRUE)[10]) != 0 &&
        (str_split(vr, ",", simplify = TRUE)[15]) != 0 && (str_split(vr, ",", simplify = TRUE)[21]) != 0){
      nbHG0_2 = nbHG0_2 + 1
    }
  }
  else if (dim(str_split(vr, ",", simplify = TRUE))[2] == 28) {
    if ((str_split(vr, ",", simplify = TRUE)[1]) != 0 && (str_split(vr, ",", simplify = TRUE)[3]) != 0 && 
        (str_split(vr, ",", simplify = TRUE)[6]) != 0 && (str_split(vr, ",", simplify = TRUE)[10]) != 0 &&
        (str_split(vr, ",", simplify = TRUE)[15]) != 0 && (str_split(vr, ",", simplify = TRUE)[21]) != 0 
        && (str_split(vr, ",", simplify = TRUE)[28]) != 0){
      nbHG0_2 = nbHG0_2 + 1
    }
  }
}
nbHG0_2
# On trouve 291 206 positions hétérozygotes

# Visualisation

x <- c(293620, 291206, 302654, 319539, 309942, 293342, 265772, 285655, 283308, 284408)

noms_barres <- c("G0_1","G0_2","Fr1_1","Fr1_2", "Fr3_1", "Fr3_2", "Ce1_1", "Ce1_2", "Ce3_1", "Ce3_2")

pdf(file = "Nombre de positions heterozygotes par échantillon",width = 10, height = 9, pointsize = 10)
barplot(x,col=c("#FE2E2E","#FE2E2E","#FE9A2E", "#FE9A2E", "#FE9A2E", "#FE9A2E",
                "#F7FE2E", "#F7FE2E", "#F7FE2E", "#F7FE2E"),cex.lab=1.4, cex.main = 2,
        names.arg=noms_barres, ylab="nombre de positions hétérozygotes",
        main="Nombre de positions heterozygotes par échantillon")
dev.off()


####### Analyse des variants sur les gènes différentiellement exprimés #########

# Chargement de la liste des gènes différentiellement exprimés en G7Fr et G7Ce
#par rapport à G0
list_gdif <- read.table("liste_genedif_Fr&Ce.txt")

# Création d'une nouvelle table vide qui contiendra les variants pour les gènes 
#différentielement exprimés
col.names = c("CHROM", "POS", "TYPE", "HET", "HOM.VAR", "NCALLED", "Ce1_1.GT",
              "Ce1_1.AD", "Ce1_1.PL", "Ce1_2.GT", "Ce1_2.AD", "Ce1_2.PL", "Ce3_1.GT",
              "Ce3_1.AD", "Ce3_1.PL", "Ce3_2.GT", "Ce3_2.AD", "Ce3_2.PL", "Fr1_1.GT",
              "Fr1_1.AD", "Fr1_1.PL", "Fr1_2.GT", "Fr1_2.AD", "Fr1_2.PL", "Fr3_1.GT",
              "Fr3_1.AD", "Fr3_1.PL", "Fr3_2.GT", "Fr3_2.AD", "Fr3_2.PL", "G0_1.GT",
              "G0_1.AD", "G0_1.PL", "G0_2.GT", "G0_2.AD", "G0_2.PL")

table_geneDif <- read.table(text = "", col.names = col.names)

# Remplissage de la table

i = 0
for (pos in table$CHROM){
  i = i + 1
  for (gene in list_gdif$V1){
    if (pos == gene){
      table_geneDif <- rbind(table_geneDif, table[i,])
    }
  }
}

i
table_geneDif
table_geneDif <- rbind(table_geneDif, table[1043,])

#### Comptage du nombre de variants par echantillon pour les gènes différentiellement exprimés 

# Pour Ce1_1
nbCe1_1 = 0
for ( vr in table_geneDif$Ce1_1.AD) {
  
  i = dim(str_split(vr, ",", simplify = TRUE))[2]
  pass = "False"
  
  while (pass == "False") {
    if ((str_split(vr, ",", simplify = TRUE)[i]) > 0){
      nbCe1_1 = nbCe1_1 + 1
      pass = "True"
    }
    i = i - 1 
    
    if (i == 1) {
      pass = "True"
    }
  }
}
nbCe1_1
# On trouve 1 539 variants

# Pour Ce1_2
nbCe1_2 = 0
for ( vr in table_geneDif$Ce1_2.AD) {
  
  i = dim(str_split(vr, ",", simplify = TRUE))[2]
  pass = "False"
  
  while (pass == "False") {
    if ((str_split(vr, ",", simplify = TRUE)[i]) > 0){
      nbCe1_2 = nbCe1_2 + 1
      pass = "True"
    }
    i = i - 1 
    
    if (i == 1) {
      pass = "True"
    }
  }
}
nbCe1_2
# On trouve 2 081 variants

# Pour Ce3_1
nbCe3_1 = 0
for ( vr in table_geneDif$Ce3_1.AD) {
  
  i = dim(str_split(vr, ",", simplify = TRUE))[2]
  pass = "False"
  
  while (pass == "False") {
    if ((str_split(vr, ",", simplify = TRUE)[i]) > 0){
      nbCe3_1 = nbCe3_1 + 1
      pass = "True"
    }
    i = i - 1 
    
    if (i == 1) {
      pass = "True"
    }
  }
}
nbCe3_1
# On trouve 1 927 variants

# Pour Ce3_2
nbCe3_2 = 0
for ( vr in table_geneDif$Ce3_2.AD) {
  
  i = dim(str_split(vr, ",", simplify = TRUE))[2]
  pass = "False"
  
  while (pass == "False") {
    if ((str_split(vr, ",", simplify = TRUE)[i]) > 0){
      nbCe3_2 = nbCe3_2 + 1
      pass = "True"
    }
    i = i - 1 
    
    if (i == 1) {
      pass = "True"
    }
  }
}
nbCe3_2
# On trouve 1 983 variants

# Pour Fr1_1
nbFr1_1 = 0
for ( vr in table_geneDif$Fr1_1.AD) {
  
  i = dim(str_split(vr, ",", simplify = TRUE))[2]
  pass = "False"
  
  while (pass == "False") {
    if ((str_split(vr, ",", simplify = TRUE)[i]) > 0){
      nbFr1_1 = nbFr1_1 + 1
      pass = "True"
    }
    i = i - 1 
    
    if (i == 1) {
      pass = "True"
    }
  }
}
nbFr1_1
# On trouve 1 773 variants

# Pour Fr1_2
nbFr1_2 = 0
for ( vr in table_geneDif$Fr1_2.AD) {
  
  i = dim(str_split(vr, ",", simplify = TRUE))[2]
  pass = "False"
  
  while (pass == "False") {
    if ((str_split(vr, ",", simplify = TRUE)[i]) > 0){
      nbFr1_2 = nbFr1_2 + 1
      pass = "True"
    }
    i = i - 1 
    
    if (i == 1) {
      pass = "True"
    }
  }
}
nbFr1_2
# On trouve 2 452 variants

# Pour Fr3_1
nbFr3_1 = 0
for ( vr in table_geneDif$Fr3_1.AD) {
  
  i = dim(str_split(vr, ",", simplify = TRUE))[2]
  pass = "False"
  
  while (pass == "False") {
    if ((str_split(vr, ",", simplify = TRUE)[i]) > 0){
      nbFr3_1 = nbFr3_1 + 1
      pass = "True"
    }
    i = i - 1 
    
    if (i == 1) {
      pass = "True"
    }
  }
}
nbFr3_1
# On trouve 2 711 variants

# Pour Fr3_2
nbFr3_2 = 0
for ( vr in table_geneDif$Fr3_2.AD) {
  
  i = dim(str_split(vr, ",", simplify = TRUE))[2]
  pass = "False"
  
  while (pass == "False") {
    if ((str_split(vr, ",", simplify = TRUE)[i]) > 0){
      nbFr3_2 = nbFr3_2 + 1
      pass = "True"
    }
    i = i - 1 
    
    if (i == 1) {
      pass = "True"
    }
  }
}
nbFr3_2
# On trouve 2 624 variants

# Pour G0_1
nbG0_1 = 0
for ( vr in table_geneDif$G0_1.AD) {
  
  i = dim(str_split(vr, ",", simplify = TRUE))[2]
  pass = "False"
  
  while (pass == "False") {
    if ((str_split(vr, ",", simplify = TRUE)[i]) > 0){
      nbG0_1 = nbG0_1 + 1
      pass = "True"
    }
    i = i - 1 
    
    if (i == 1) {
      pass = "True"
    }
  }
}
nbG0_1
# On trouve 501 variants

# Pour G0_2
nbG0_2 = 0
for ( vr in table_geneDif$G0_2.AD) {
  
  i = dim(str_split(vr, ",", simplify = TRUE))[2]
  pass = "False"
  
  while (pass == "False") {
    if ((str_split(vr, ",", simplify = TRUE)[i]) > 0){
      nbG0_2 = nbG0_2 + 1
      pass = "True"
    }
    i = i - 1 
    
    if (i == 1) {
      pass = "True"
    }
  }
}
nbG0_2
# On trouve 639 variants

# Visualisation

x <- c(501, 639, 1773, 2452, 2711, 2624, 1539, 2081, 1927, 1983)

noms_barres <- c("G0_1","G0_2","Fr1_1","Fr1_2", "Fr3_1", "Fr3_2", "Ce1_1", "Ce1_2", "Ce3_1", "Ce3_2")

pdf(file = "Nombre de variants par échantillon pour les gènes différentiellement exprimés",width = 10, height = 9, pointsize = 10)
barplot(x,col=c("#FE2E2E","#FE2E2E","#FE9A2E", "#FE9A2E", "#FE9A2E", "#FE9A2E",
                "#F7FE2E", "#F7FE2E", "#F7FE2E", "#F7FE2E"), cex.lab=1.4, cex.main = 2,
        names.arg=noms_barres, ylab="nombre de variants",
        main="Nombre de variants par échantillon pour les gènes \n différentiellement exprimés en G7Fr et G7Ce par rapport à G0")
dev.off()


#### Comptage du nombre d'hétérozygotes par échantillon pour les gènes différentiellement exprimés

# Pour Ce1_1
nbHCe1_1 = 0
for ( vr in table_geneDif$Ce1_1.PL) {
  if (dim(str_split(vr, ",", simplify = TRUE))[2] == 3) {
    if ((str_split(vr, ",", simplify = TRUE)[2]) == 0 && (str_split(vr, ",", simplify = TRUE)[1]) != 0 ){
      nbHCe1_1 = nbHCe1_1 + 1
    }
  }
  else if (dim(str_split(vr, ",", simplify = TRUE))[2] == 6) {
    if ((str_split(vr, ",", simplify = TRUE)[1]) != 0 && (str_split(vr, ",", simplify = TRUE)[3]) != 0 && 
        (str_split(vr, ",", simplify = TRUE)[6]) != 0){
      nbHCe1_1 = nbHCe1_1 + 1
    } 
  }
  else if (dim(str_split(vr, ",", simplify = TRUE))[2] == 10) {
    if ((str_split(vr, ",", simplify = TRUE)[1]) != 0 && (str_split(vr, ",", simplify = TRUE)[3]) != 0 && 
        (str_split(vr, ",", simplify = TRUE)[6]) != 0 && (str_split(vr, ",", simplify = TRUE)[10]) != 0){
      nbHCe1_1 = nbHCe1_1 + 1
    }
  }
  else if (dim(str_split(vr, ",", simplify = TRUE))[2] == 15) {
    if ((str_split(vr, ",", simplify = TRUE)[1]) != 0 && (str_split(vr, ",", simplify = TRUE)[3]) != 0 && 
        (str_split(vr, ",", simplify = TRUE)[6]) != 0 && (str_split(vr, ",", simplify = TRUE)[10]) != 0 &&
        (str_split(vr, ",", simplify = TRUE)[15]) != 0){
      nbHCe1_1 = nbHCe1_1 + 1
    }
  }
  else if (dim(str_split(vr, ",", simplify = TRUE))[2] == 21) {
    if ((str_split(vr, ",", simplify = TRUE)[1]) != 0 && (str_split(vr, ",", simplify = TRUE)[3]) != 0 && 
        (str_split(vr, ",", simplify = TRUE)[6]) != 0 && (str_split(vr, ",", simplify = TRUE)[10]) != 0 &&
        (str_split(vr, ",", simplify = TRUE)[15]) != 0 && (str_split(vr, ",", simplify = TRUE)[21]) != 0){
      nbHCe1_1 = nbHCe1_1 + 1
    }
  }
  else if (dim(str_split(vr, ",", simplify = TRUE))[2] == 28) {
    if ((str_split(vr, ",", simplify = TRUE)[1]) != 0 && (str_split(vr, ",", simplify = TRUE)[3]) != 0 && 
        (str_split(vr, ",", simplify = TRUE)[6]) != 0 && (str_split(vr, ",", simplify = TRUE)[10]) != 0 &&
        (str_split(vr, ",", simplify = TRUE)[15]) != 0 && (str_split(vr, ",", simplify = TRUE)[21]) != 0 
        && (str_split(vr, ",", simplify = TRUE)[28]) != 0){
      nbHCe1_1 = nbHCe1_1 + 1
    }
  }
}
nbHCe1_1
# On trouve 898 positions hétérozygotes


# Pour Ce1_2
nbHCe1_2 = 0
for ( vr in table_geneDif$Ce1_2.PL) {
  if (dim(str_split(vr, ",", simplify = TRUE))[2] == 3) {
    if ((str_split(vr, ",", simplify = TRUE)[2]) == 0 && (str_split(vr, ",", simplify = TRUE)[1]) != 0 ){
      nbHCe1_2 = nbHCe1_2 + 1
    }
  }
  else if (dim(str_split(vr, ",", simplify = TRUE))[2] == 6) {
    if ((str_split(vr, ",", simplify = TRUE)[1]) != 0 && (str_split(vr, ",", simplify = TRUE)[3]) != 0 && 
        (str_split(vr, ",", simplify = TRUE)[6]) != 0){
      nbHCe1_2 = nbHCe1_2 + 1
    } 
  }
  else if (dim(str_split(vr, ",", simplify = TRUE))[2] == 10) {
    if ((str_split(vr, ",", simplify = TRUE)[1]) != 0 && (str_split(vr, ",", simplify = TRUE)[3]) != 0 && 
        (str_split(vr, ",", simplify = TRUE)[6]) != 0 && (str_split(vr, ",", simplify = TRUE)[10]) != 0){
      nbHCe1_2 = nbHCe1_2 + 1
    }
  }
  else if (dim(str_split(vr, ",", simplify = TRUE))[2] == 15) {
    if ((str_split(vr, ",", simplify = TRUE)[1]) != 0 && (str_split(vr, ",", simplify = TRUE)[3]) != 0 && 
        (str_split(vr, ",", simplify = TRUE)[6]) != 0 && (str_split(vr, ",", simplify = TRUE)[10]) != 0 &&
        (str_split(vr, ",", simplify = TRUE)[15]) != 0){
      nbHCe1_2 = nbHCe1_2 + 1
    }
  }
  else if (dim(str_split(vr, ",", simplify = TRUE))[2] == 21) {
    if ((str_split(vr, ",", simplify = TRUE)[1]) != 0 && (str_split(vr, ",", simplify = TRUE)[3]) != 0 && 
        (str_split(vr, ",", simplify = TRUE)[6]) != 0 && (str_split(vr, ",", simplify = TRUE)[10]) != 0 &&
        (str_split(vr, ",", simplify = TRUE)[15]) != 0 && (str_split(vr, ",", simplify = TRUE)[21]) != 0){
      nbHCe1_2 = nbHCe1_2 + 1
    }
  }
  else if (dim(str_split(vr, ",", simplify = TRUE))[2] == 28) {
    if ((str_split(vr, ",", simplify = TRUE)[1]) != 0 && (str_split(vr, ",", simplify = TRUE)[3]) != 0 && 
        (str_split(vr, ",", simplify = TRUE)[6]) != 0 && (str_split(vr, ",", simplify = TRUE)[10]) != 0 &&
        (str_split(vr, ",", simplify = TRUE)[15]) != 0 && (str_split(vr, ",", simplify = TRUE)[21]) != 0 
        && (str_split(vr, ",", simplify = TRUE)[28]) != 0){
      nbHCe1_2 = nbHCe1_2 + 1
    }
  }
}
nbHCe1_2
# On trouve 1 275 positions hétérozygotes

# Pour Ce3_1
nbHCe3_1 = 0
for ( vr in table_geneDif$Ce3_1.PL) {
  if (dim(str_split(vr, ",", simplify = TRUE))[2] == 3) {
    if ((str_split(vr, ",", simplify = TRUE)[2]) == 0 && (str_split(vr, ",", simplify = TRUE)[1]) != 0 ){
      nbHCe3_1 = nbHCe3_1 + 1
    }
  }
  else if (dim(str_split(vr, ",", simplify = TRUE))[2] == 6) {
    if ((str_split(vr, ",", simplify = TRUE)[1]) != 0 && (str_split(vr, ",", simplify = TRUE)[3]) != 0 && 
        (str_split(vr, ",", simplify = TRUE)[6]) != 0){
      nbHCe3_1 = nbHCe3_1 + 1
    } 
  }
  else if (dim(str_split(vr, ",", simplify = TRUE))[2] == 10) {
    if ((str_split(vr, ",", simplify = TRUE)[1]) != 0 && (str_split(vr, ",", simplify = TRUE)[3]) != 0 && 
        (str_split(vr, ",", simplify = TRUE)[6]) != 0 && (str_split(vr, ",", simplify = TRUE)[10]) != 0){
      nbHCe3_1 = nbHCe3_1 + 1
    }
  }
  else if (dim(str_split(vr, ",", simplify = TRUE))[2] == 15) {
    if ((str_split(vr, ",", simplify = TRUE)[1]) != 0 && (str_split(vr, ",", simplify = TRUE)[3]) != 0 && 
        (str_split(vr, ",", simplify = TRUE)[6]) != 0 && (str_split(vr, ",", simplify = TRUE)[10]) != 0 &&
        (str_split(vr, ",", simplify = TRUE)[15]) != 0){
      nbHCe3_1 = nbHCe3_1 + 1
    }
  }
  else if (dim(str_split(vr, ",", simplify = TRUE))[2] == 21) {
    if ((str_split(vr, ",", simplify = TRUE)[1]) != 0 && (str_split(vr, ",", simplify = TRUE)[3]) != 0 && 
        (str_split(vr, ",", simplify = TRUE)[6]) != 0 && (str_split(vr, ",", simplify = TRUE)[10]) != 0 &&
        (str_split(vr, ",", simplify = TRUE)[15]) != 0 && (str_split(vr, ",", simplify = TRUE)[21]) != 0){
      nbHCe3_1 = nbHCe3_1 + 1
    }
  }
  else if (dim(str_split(vr, ",", simplify = TRUE))[2] == 28) {
    if ((str_split(vr, ",", simplify = TRUE)[1]) != 0 && (str_split(vr, ",", simplify = TRUE)[3]) != 0 && 
        (str_split(vr, ",", simplify = TRUE)[6]) != 0 && (str_split(vr, ",", simplify = TRUE)[10]) != 0 &&
        (str_split(vr, ",", simplify = TRUE)[15]) != 0 && (str_split(vr, ",", simplify = TRUE)[21]) != 0 
        && (str_split(vr, ",", simplify = TRUE)[28]) != 0){
      nbHCe3_1 = nbHCe3_1 + 1
    }
  }
}
nbHCe3_1
# On trouve 1 188 positions hétérozygotes

# Pour Ce3_2
nbHCe3_2 = 0
for ( vr in table_geneDif$Ce3_2.PL) {
  if (dim(str_split(vr, ",", simplify = TRUE))[2] == 3) {
    if ((str_split(vr, ",", simplify = TRUE)[2]) == 0 && (str_split(vr, ",", simplify = TRUE)[1]) != 0 ){
      nbHCe3_2 = nbHCe3_2 + 1
    }
  }
  else if (dim(str_split(vr, ",", simplify = TRUE))[2] == 6) {
    if ((str_split(vr, ",", simplify = TRUE)[1]) != 0 && (str_split(vr, ",", simplify = TRUE)[3]) != 0 && 
        (str_split(vr, ",", simplify = TRUE)[6]) != 0){
      nbHCe3_2 = nbHCe3_2 + 1
    } 
  }
  else if (dim(str_split(vr, ",", simplify = TRUE))[2] == 10) {
    if ((str_split(vr, ",", simplify = TRUE)[1]) != 0 && (str_split(vr, ",", simplify = TRUE)[3]) != 0 && 
        (str_split(vr, ",", simplify = TRUE)[6]) != 0 && (str_split(vr, ",", simplify = TRUE)[10]) != 0){
      nbHCe3_2 = nbHCe3_2 + 1
    }
  }
  else if (dim(str_split(vr, ",", simplify = TRUE))[2] == 15) {
    if ((str_split(vr, ",", simplify = TRUE)[1]) != 0 && (str_split(vr, ",", simplify = TRUE)[3]) != 0 && 
        (str_split(vr, ",", simplify = TRUE)[6]) != 0 && (str_split(vr, ",", simplify = TRUE)[10]) != 0 &&
        (str_split(vr, ",", simplify = TRUE)[15]) != 0){
      nbHCe3_2 = nbHCe3_2 + 1
    }
  }
  else if (dim(str_split(vr, ",", simplify = TRUE))[2] == 21) {
    if ((str_split(vr, ",", simplify = TRUE)[1]) != 0 && (str_split(vr, ",", simplify = TRUE)[3]) != 0 && 
        (str_split(vr, ",", simplify = TRUE)[6]) != 0 && (str_split(vr, ",", simplify = TRUE)[10]) != 0 &&
        (str_split(vr, ",", simplify = TRUE)[15]) != 0 && (str_split(vr, ",", simplify = TRUE)[21]) != 0){
      nbHCe3_2 = nbHCe3_2 + 1
    }
  }
  else if (dim(str_split(vr, ",", simplify = TRUE))[2] == 28) {
    if ((str_split(vr, ",", simplify = TRUE)[1]) != 0 && (str_split(vr, ",", simplify = TRUE)[3]) != 0 && 
        (str_split(vr, ",", simplify = TRUE)[6]) != 0 && (str_split(vr, ",", simplify = TRUE)[10]) != 0 &&
        (str_split(vr, ",", simplify = TRUE)[15]) != 0 && (str_split(vr, ",", simplify = TRUE)[21]) != 0 
        && (str_split(vr, ",", simplify = TRUE)[28]) != 0){
      nbHCe3_2 = nbHCe3_2 + 1
    }
  }
}
nbHCe3_2
# On trouve 1 176 positions hétérozygotes

# Pour Fr1_1
nbHFr1_1 = 0
for ( vr in table_geneDif$Fr1_1.PL) {
  if (dim(str_split(vr, ",", simplify = TRUE))[2] == 3) {
    if ((str_split(vr, ",", simplify = TRUE)[2]) == 0 && (str_split(vr, ",", simplify = TRUE)[1]) != 0 ){
      nbHFr1_1 = nbHFr1_1 + 1
    }
  }
  else if (dim(str_split(vr, ",", simplify = TRUE))[2] == 6) {
    if ((str_split(vr, ",", simplify = TRUE)[1]) != 0 && (str_split(vr, ",", simplify = TRUE)[3]) != 0 && 
        (str_split(vr, ",", simplify = TRUE)[6]) != 0){
      nbHFr1_1 = nbHFr1_1 + 1
    } 
  }
  else if (dim(str_split(vr, ",", simplify = TRUE))[2] == 10) {
    if ((str_split(vr, ",", simplify = TRUE)[1]) != 0 && (str_split(vr, ",", simplify = TRUE)[3]) != 0 && 
        (str_split(vr, ",", simplify = TRUE)[6]) != 0 && (str_split(vr, ",", simplify = TRUE)[10]) != 0){
      nbHFr1_1 = nbHFr1_1 + 1
    }
  }
  else if (dim(str_split(vr, ",", simplify = TRUE))[2] == 15) {
    if ((str_split(vr, ",", simplify = TRUE)[1]) != 0 && (str_split(vr, ",", simplify = TRUE)[3]) != 0 && 
        (str_split(vr, ",", simplify = TRUE)[6]) != 0 && (str_split(vr, ",", simplify = TRUE)[10]) != 0 &&
        (str_split(vr, ",", simplify = TRUE)[15]) != 0){
      nbHFr1_1 = nbHFr1_1 + 1
    }
  }
  else if (dim(str_split(vr, ",", simplify = TRUE))[2] == 21) {
    if ((str_split(vr, ",", simplify = TRUE)[1]) != 0 && (str_split(vr, ",", simplify = TRUE)[3]) != 0 && 
        (str_split(vr, ",", simplify = TRUE)[6]) != 0 && (str_split(vr, ",", simplify = TRUE)[10]) != 0 &&
        (str_split(vr, ",", simplify = TRUE)[15]) != 0 && (str_split(vr, ",", simplify = TRUE)[21]) != 0){
      nbHFr1_1 = nbHFr1_1 + 1
    }
  }
  else if (dim(str_split(vr, ",", simplify = TRUE))[2] == 28) {
    if ((str_split(vr, ",", simplify = TRUE)[1]) != 0 && (str_split(vr, ",", simplify = TRUE)[3]) != 0 && 
        (str_split(vr, ",", simplify = TRUE)[6]) != 0 && (str_split(vr, ",", simplify = TRUE)[10]) != 0 &&
        (str_split(vr, ",", simplify = TRUE)[15]) != 0 && (str_split(vr, ",", simplify = TRUE)[21]) != 0 
        && (str_split(vr, ",", simplify = TRUE)[28]) != 0){
      nbHFr1_1 = nbHFr1_1 + 1
    }
  }
}
nbHFr1_1
# On trouve 1 074 positions hétérozygotes

# Pour Fr1_2
nbHFr1_2 = 0
for ( vr in table_geneDif$Fr1_2.PL) {
  if (dim(str_split(vr, ",", simplify = TRUE))[2] == 3) {
    if ((str_split(vr, ",", simplify = TRUE)[2]) == 0 && (str_split(vr, ",", simplify = TRUE)[1]) != 0 ){
      nbHFr1_2 = nbHFr1_2 + 1
    }
  }
  else if (dim(str_split(vr, ",", simplify = TRUE))[2] == 6) {
    if ((str_split(vr, ",", simplify = TRUE)[1]) != 0 && (str_split(vr, ",", simplify = TRUE)[3]) != 0 && 
        (str_split(vr, ",", simplify = TRUE)[6]) != 0){
      nbHFr1_2 = nbHFr1_2 + 1
    } 
  }
  else if (dim(str_split(vr, ",", simplify = TRUE))[2] == 10) {
    if ((str_split(vr, ",", simplify = TRUE)[1]) != 0 && (str_split(vr, ",", simplify = TRUE)[3]) != 0 && 
        (str_split(vr, ",", simplify = TRUE)[6]) != 0 && (str_split(vr, ",", simplify = TRUE)[10]) != 0){
      nbHFr1_2 = nbHFr1_2 + 1
    }
  }
  else if (dim(str_split(vr, ",", simplify = TRUE))[2] == 15) {
    if ((str_split(vr, ",", simplify = TRUE)[1]) != 0 && (str_split(vr, ",", simplify = TRUE)[3]) != 0 && 
        (str_split(vr, ",", simplify = TRUE)[6]) != 0 && (str_split(vr, ",", simplify = TRUE)[10]) != 0 &&
        (str_split(vr, ",", simplify = TRUE)[15]) != 0){
      nbHFr1_2 = nbHFr1_2 + 1
    }
  }
  else if (dim(str_split(vr, ",", simplify = TRUE))[2] == 21) {
    if ((str_split(vr, ",", simplify = TRUE)[1]) != 0 && (str_split(vr, ",", simplify = TRUE)[3]) != 0 && 
        (str_split(vr, ",", simplify = TRUE)[6]) != 0 && (str_split(vr, ",", simplify = TRUE)[10]) != 0 &&
        (str_split(vr, ",", simplify = TRUE)[15]) != 0 && (str_split(vr, ",", simplify = TRUE)[21]) != 0){
      nbHFr1_2 = nbHFr1_2 + 1
    }
  }
  else if (dim(str_split(vr, ",", simplify = TRUE))[2] == 28) {
    if ((str_split(vr, ",", simplify = TRUE)[1]) != 0 && (str_split(vr, ",", simplify = TRUE)[3]) != 0 && 
        (str_split(vr, ",", simplify = TRUE)[6]) != 0 && (str_split(vr, ",", simplify = TRUE)[10]) != 0 &&
        (str_split(vr, ",", simplify = TRUE)[15]) != 0 && (str_split(vr, ",", simplify = TRUE)[21]) != 0 
        && (str_split(vr, ",", simplify = TRUE)[28]) != 0){
      nbHFr1_2 = nbHFr1_2 + 1
    }
  }
}
nbHFr1_2
# On trouve 1 653 positions hétérozygotes

# Pour Fr3_1
nbHFr3_1 = 0
for ( vr in table_geneDif$Fr3_1.PL) {
  if (dim(str_split(vr, ",", simplify = TRUE))[2] == 3) {
    if ((str_split(vr, ",", simplify = TRUE)[2]) == 0 && (str_split(vr, ",", simplify = TRUE)[1]) != 0 ){
      nbHFr3_1 = nbHFr3_1 + 1
    }
  }
  else if (dim(str_split(vr, ",", simplify = TRUE))[2] == 6) {
    if ((str_split(vr, ",", simplify = TRUE)[1]) != 0 && (str_split(vr, ",", simplify = TRUE)[3]) != 0 && 
        (str_split(vr, ",", simplify = TRUE)[6]) != 0){
      nbHFr3_1 = nbHFr3_1 + 1
    } 
  }
  else if (dim(str_split(vr, ",", simplify = TRUE))[2] == 10) {
    if ((str_split(vr, ",", simplify = TRUE)[1]) != 0 && (str_split(vr, ",", simplify = TRUE)[3]) != 0 && 
        (str_split(vr, ",", simplify = TRUE)[6]) != 0 && (str_split(vr, ",", simplify = TRUE)[10]) != 0){
      nbHFr3_1 = nbHFr3_1 + 1
    }
  }
  else if (dim(str_split(vr, ",", simplify = TRUE))[2] == 15) {
    if ((str_split(vr, ",", simplify = TRUE)[1]) != 0 && (str_split(vr, ",", simplify = TRUE)[3]) != 0 && 
        (str_split(vr, ",", simplify = TRUE)[6]) != 0 && (str_split(vr, ",", simplify = TRUE)[10]) != 0 &&
        (str_split(vr, ",", simplify = TRUE)[15]) != 0){
      nbHFr3_1 = nbHFr3_1 + 1
    }
  }
  else if (dim(str_split(vr, ",", simplify = TRUE))[2] == 21) {
    if ((str_split(vr, ",", simplify = TRUE)[1]) != 0 && (str_split(vr, ",", simplify = TRUE)[3]) != 0 && 
        (str_split(vr, ",", simplify = TRUE)[6]) != 0 && (str_split(vr, ",", simplify = TRUE)[10]) != 0 &&
        (str_split(vr, ",", simplify = TRUE)[15]) != 0 && (str_split(vr, ",", simplify = TRUE)[21]) != 0){
      nbHFr3_1 = nbHFr3_1 + 1
    }
  }
  else if (dim(str_split(vr, ",", simplify = TRUE))[2] == 28) {
    if ((str_split(vr, ",", simplify = TRUE)[1]) != 0 && (str_split(vr, ",", simplify = TRUE)[3]) != 0 && 
        (str_split(vr, ",", simplify = TRUE)[6]) != 0 && (str_split(vr, ",", simplify = TRUE)[10]) != 0 &&
        (str_split(vr, ",", simplify = TRUE)[15]) != 0 && (str_split(vr, ",", simplify = TRUE)[21]) != 0 
        && (str_split(vr, ",", simplify = TRUE)[28]) != 0){
      nbHFr3_1 = nbHFr3_1 + 1
    }
  }
}
nbHFr3_1
# On trouve 1 820 positions hétérozygotes

# Pour Fr3_2
nbHFr3_2 = 0
for ( vr in table_geneDif$Fr3_2.PL) {
  if (dim(str_split(vr, ",", simplify = TRUE))[2] == 3) {
    if ((str_split(vr, ",", simplify = TRUE)[2]) == 0 && (str_split(vr, ",", simplify = TRUE)[1]) != 0 ){
      nbHFr3_2 = nbHFr3_2 + 1
    }
  }
  else if (dim(str_split(vr, ",", simplify = TRUE))[2] == 6) {
    if ((str_split(vr, ",", simplify = TRUE)[1]) != 0 && (str_split(vr, ",", simplify = TRUE)[3]) != 0 && 
        (str_split(vr, ",", simplify = TRUE)[6]) != 0){
      nbHFr3_2 = nbHFr3_2 + 1
    } 
  }
  else if (dim(str_split(vr, ",", simplify = TRUE))[2] == 10) {
    if ((str_split(vr, ",", simplify = TRUE)[1]) != 0 && (str_split(vr, ",", simplify = TRUE)[3]) != 0 && 
        (str_split(vr, ",", simplify = TRUE)[6]) != 0 && (str_split(vr, ",", simplify = TRUE)[10]) != 0){
      nbHFr3_2 = nbHFr3_2 + 1
    }
  }
  else if (dim(str_split(vr, ",", simplify = TRUE))[2] == 15) {
    if ((str_split(vr, ",", simplify = TRUE)[1]) != 0 && (str_split(vr, ",", simplify = TRUE)[3]) != 0 && 
        (str_split(vr, ",", simplify = TRUE)[6]) != 0 && (str_split(vr, ",", simplify = TRUE)[10]) != 0 &&
        (str_split(vr, ",", simplify = TRUE)[15]) != 0){
      nbHFr3_2 = nbHFr3_2 + 1
    }
  }
  else if (dim(str_split(vr, ",", simplify = TRUE))[2] == 21) {
    if ((str_split(vr, ",", simplify = TRUE)[1]) != 0 && (str_split(vr, ",", simplify = TRUE)[3]) != 0 && 
        (str_split(vr, ",", simplify = TRUE)[6]) != 0 && (str_split(vr, ",", simplify = TRUE)[10]) != 0 &&
        (str_split(vr, ",", simplify = TRUE)[15]) != 0 && (str_split(vr, ",", simplify = TRUE)[21]) != 0){
      nbHFr3_2 = nbHFr3_2 + 1
    }
  }
  else if (dim(str_split(vr, ",", simplify = TRUE))[2] == 28) {
    if ((str_split(vr, ",", simplify = TRUE)[1]) != 0 && (str_split(vr, ",", simplify = TRUE)[3]) != 0 && 
        (str_split(vr, ",", simplify = TRUE)[6]) != 0 && (str_split(vr, ",", simplify = TRUE)[10]) != 0 &&
        (str_split(vr, ",", simplify = TRUE)[15]) != 0 && (str_split(vr, ",", simplify = TRUE)[21]) != 0 
        && (str_split(vr, ",", simplify = TRUE)[28]) != 0){
      nbHFr3_2 = nbHFr3_2 + 1
    }
  }
}
nbHFr3_2
# On trouve 1674 positions hétérozygotes

# Pour G0_1
nbHG0_1 = 0
for ( vr in table_geneDif$G0_1.PL) {
  if (dim(str_split(vr, ",", simplify = TRUE))[2] == 3) {
    if ((str_split(vr, ",", simplify = TRUE)[2]) == 0 && (str_split(vr, ",", simplify = TRUE)[1]) != 0 ){
      nbHG0_1 = nbHG0_1 + 1
    }
  }
  else if (dim(str_split(vr, ",", simplify = TRUE))[2] == 6) {
    if ((str_split(vr, ",", simplify = TRUE)[1]) != 0 && (str_split(vr, ",", simplify = TRUE)[3]) != 0 && 
        (str_split(vr, ",", simplify = TRUE)[6]) != 0){
      nbHG0_1 = nbHG0_1 + 1
    } 
  }
  else if (dim(str_split(vr, ",", simplify = TRUE))[2] == 10) {
    if ((str_split(vr, ",", simplify = TRUE)[1]) != 0 && (str_split(vr, ",", simplify = TRUE)[3]) != 0 && 
        (str_split(vr, ",", simplify = TRUE)[6]) != 0 && (str_split(vr, ",", simplify = TRUE)[10]) != 0){
      nbHG0_1 = nbHG0_1 + 1
    }
  }
  else if (dim(str_split(vr, ",", simplify = TRUE))[2] == 15) {
    if ((str_split(vr, ",", simplify = TRUE)[1]) != 0 && (str_split(vr, ",", simplify = TRUE)[3]) != 0 && 
        (str_split(vr, ",", simplify = TRUE)[6]) != 0 && (str_split(vr, ",", simplify = TRUE)[10]) != 0 &&
        (str_split(vr, ",", simplify = TRUE)[15]) != 0){
      nbHG0_1 = nbHG0_1 + 1
    }
  }
  else if (dim(str_split(vr, ",", simplify = TRUE))[2] == 21) {
    if ((str_split(vr, ",", simplify = TRUE)[1]) != 0 && (str_split(vr, ",", simplify = TRUE)[3]) != 0 && 
        (str_split(vr, ",", simplify = TRUE)[6]) != 0 && (str_split(vr, ",", simplify = TRUE)[10]) != 0 &&
        (str_split(vr, ",", simplify = TRUE)[15]) != 0 && (str_split(vr, ",", simplify = TRUE)[21]) != 0){
      nbHG0_1 = nbHG0_1 + 1
    }
  }
  else if (dim(str_split(vr, ",", simplify = TRUE))[2] == 28) {
    if ((str_split(vr, ",", simplify = TRUE)[1]) != 0 && (str_split(vr, ",", simplify = TRUE)[3]) != 0 && 
        (str_split(vr, ",", simplify = TRUE)[6]) != 0 && (str_split(vr, ",", simplify = TRUE)[10]) != 0 &&
        (str_split(vr, ",", simplify = TRUE)[15]) != 0 && (str_split(vr, ",", simplify = TRUE)[21]) != 0 
        && (str_split(vr, ",", simplify = TRUE)[28]) != 0){
      nbHG0_1 = nbHG0_1 + 1
    }
  }
}
nbHG0_1
# On trouve 236 positions hétérozygotes

# Pour G0_2
nbHG0_2 = 0
for ( vr in table_geneDif$G0_2.PL) {
  if (dim(str_split(vr, ",", simplify = TRUE))[2] == 3) {
    if ((str_split(vr, ",", simplify = TRUE)[2]) == 0 && (str_split(vr, ",", simplify = TRUE)[1]) != 0 ){
      nbHG0_2 = nbHG0_2 + 1
    }
  }
  else if (dim(str_split(vr, ",", simplify = TRUE))[2] == 6) {
    if ((str_split(vr, ",", simplify = TRUE)[1]) != 0 && (str_split(vr, ",", simplify = TRUE)[3]) != 0 && 
        (str_split(vr, ",", simplify = TRUE)[6]) != 0){
      nbHG0_2 = nbHG0_2 + 1
    } 
  }
  else if (dim(str_split(vr, ",", simplify = TRUE))[2] == 10) {
    if ((str_split(vr, ",", simplify = TRUE)[1]) != 0 && (str_split(vr, ",", simplify = TRUE)[3]) != 0 && 
        (str_split(vr, ",", simplify = TRUE)[6]) != 0 && (str_split(vr, ",", simplify = TRUE)[10]) != 0){
      nbHG0_2 = nbHG0_2 + 1
    }
  }
  else if (dim(str_split(vr, ",", simplify = TRUE))[2] == 15) {
    if ((str_split(vr, ",", simplify = TRUE)[1]) != 0 && (str_split(vr, ",", simplify = TRUE)[3]) != 0 && 
        (str_split(vr, ",", simplify = TRUE)[6]) != 0 && (str_split(vr, ",", simplify = TRUE)[10]) != 0 &&
        (str_split(vr, ",", simplify = TRUE)[15]) != 0){
      nbHG0_2 = nbHG0_2 + 1
    }
  }
  else if (dim(str_split(vr, ",", simplify = TRUE))[2] == 21) {
    if ((str_split(vr, ",", simplify = TRUE)[1]) != 0 && (str_split(vr, ",", simplify = TRUE)[3]) != 0 && 
        (str_split(vr, ",", simplify = TRUE)[6]) != 0 && (str_split(vr, ",", simplify = TRUE)[10]) != 0 &&
        (str_split(vr, ",", simplify = TRUE)[15]) != 0 && (str_split(vr, ",", simplify = TRUE)[21]) != 0){
      nbHG0_2 = nbHG0_2 + 1
    }
  }
  else if (dim(str_split(vr, ",", simplify = TRUE))[2] == 28) {
    if ((str_split(vr, ",", simplify = TRUE)[1]) != 0 && (str_split(vr, ",", simplify = TRUE)[3]) != 0 && 
        (str_split(vr, ",", simplify = TRUE)[6]) != 0 && (str_split(vr, ",", simplify = TRUE)[10]) != 0 &&
        (str_split(vr, ",", simplify = TRUE)[15]) != 0 && (str_split(vr, ",", simplify = TRUE)[21]) != 0 
        && (str_split(vr, ",", simplify = TRUE)[28]) != 0){
      nbHG0_2 = nbHG0_2 + 1
    }
  }
}
nbHG0_2
# On trouve 333 positions hétérozygotes

# Visualisation

x <- c(236, 333, 1074, 1653, 1820, 1674, 898, 1275, 1188, 1176)

noms_barres <- c("G0_1","G0_2","Fr1_1","Fr1_2", "Fr3_1", "Fr3_2", "Ce1_1", "Ce1_2", "Ce3_1", "Ce3_2")

pdf(file = "Nombre de positions heterozygotes par échantillon pour les gènes différentiellement exprimés",width = 10, height = 9, pointsize = 10)
barplot(x,col=c("#FE2E2E","#FE2E2E","#FE9A2E", "#FE9A2E", "#FE9A2E", "#FE9A2E",
                "#F7FE2E", "#F7FE2E", "#F7FE2E", "#F7FE2E"), cex.lab=1.4, cex.main = 2,
        names.arg=noms_barres, ylab="nombre de positions hétérozygotes",
        main="Nombre de positions heterozygotes par échantillon pour les gènes \n différentiellement exprimés en G7Fr et G7Ce par rapport à G0")
dev.off()
