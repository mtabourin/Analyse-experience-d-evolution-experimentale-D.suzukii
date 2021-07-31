#!/usr/bin/env python3

import sys
import os

def clin_bed(file):
    '''
    A partir d'un fichier bed, permet de faire un fichier avec seulement les lignes
    correspondantes à un gène complet (gène avec sa position sur son contig).
    '''
    name = os.path.splitext(file)[0].split('/')[-1]
    with open(file, "r") as f:
        with open(f'{name}-cline.bed', "w") as fnew:
            for line in f:
                newline = line.split('\t')
                if newline[7] == "gene":
                    fnew.write(line)

if __name__ == "__main__":
    file = sys.argv[1]
    clin_bed(file)

