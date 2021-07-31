#!/usr/bin/env python3

import sys
import os

def filtre_fasta(fasta, length):
    '''
    À partir d'un fichier de sortie de Trinity au format fasta et d'une longueur de séquence,
    crée un fichier fasta filtré avec seulement les séquences plus longues que la longueur donnée en entré.
    '''
    name = os.path.splitext(fasta)[0].split('/')[-1]
    seq = False

    with open(fasta, "r") as f: 
        with open(f"{name}_filtre.fasta", "w") as newf: 
            for align in f: 
                if align[0] == ">":
                    align_cline = align.split(" ")
                    align_cline = align_cline[1].split("=")
                    if int(align_cline[1]) > int(length): 
                        seq = True
                        newf.write(align) 
                    else:
                        seq = False
                elif seq == True:
                    newf.write(align)


if __name__ == "__main__":
        filtre_fasta(sys.argv[1], sys.argv[2])
