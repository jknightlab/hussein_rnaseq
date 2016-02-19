#!/bin/bash


for i in `cat cluster5.txt | grep -v gene | awk '{print $1}'`; do cat gene_association.goa_human.txt | grep -P "\t$i\t" -m 1 | awk '{print $3 "\t" $10}'; done > cluster5_annotation.txt

for i in `cat cluster4.txt | grep -v gene | awk '{print $1}'`; do cat gene_association.goa_human.txt | grep -P "\t$i\t" -m 1 | awk '{print $3 "\t" $10}'; done > cluster4_annotation.txt

for i in `cat cluster3.txt | grep -v gene | awk '{print $1}'`; do cat gene_association.goa_human.txt | grep -P "\t$i\t" -m 1 | awk '{print $3 "\t" $10}'; done > cluster3_annotation.txt

for i in `cat cluster2.txt | grep -v gene | awk '{print $1}'`; do cat gene_association.goa_human.txt | grep -P "\t$i\t" -m 1 | awk '{print $3 "\t" $10}'; done > cluster2_annotation.txt

for i in `cat cluster1.txt | grep -v gene | awk '{print $1}'`; do cat gene_association.goa_human.txt | grep -P "\t$i\t" -m 1 | awk '{print $3 "\t" $10}'; done > cluster1_annotation.txt

