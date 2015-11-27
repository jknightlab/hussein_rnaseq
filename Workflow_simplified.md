Differential gene expression
--------------------------------------

The goal of this project was, starting from the sequencing
files provided by the Sequencing Core of WTCHG, to generate
a list of differentially expressed genes specific per cell
line. This was also the first sequencing performed on HiSeq4000.


### Experimental Design

Initially, five cell lines were planned to be analyzed.

- Group 1: 4 CSF+ samples (sample 1, sample 6, sample 12, sample 16)
- Group 2: 4 IL17A+ samples (sample 2, sample 7, sample 13, sample 17)
- Group 3: 4 IFN+ samples (sample 3, sample 8, sample 14, sample 18)
- Group 4: 3 IL17A+GMCSF+IFN- samples (sample 4, sample 9, sample 19)
- Group 5: 3 CD45RA+Cyt- samples (sample 5, sample 10, sample 20)

- Sample 11: these cells were sorted only on IFN+ by mistake and
not IFN+, IL-17A-, GM-CSF-. Sample 11 will be most like group 3 but
not as pure.

- Sample 15: these cells are triple cytokine negative but not sorted
on CD45. This sample will be most like group 5 but not as pure.

Genes that had to be expressed specifically for each cell type:

- `CSF2`  should be expressed in GM-CSF cells (group 1, group 4)
- `IL17A` should be expressed in IL17A+ cells (group 2, group 4)
- `IFNG`  should be expressed in IFN+ cells (group 3)
- `PTPRC` should be expressed in all cells.


### General overview of the sequencing data

This table contains general information (numbers of sequenced and
mapped reads, number of reads retained after removing duplicates,
number of reads mapped to exons, input concentration of RNA).


| sample_name | input_yield | sequenced reads | mapped reads | mapped reads nodup | reads mapped to exons |
| ---------------- | --- | ---------- | ---------- | ---------- | ---------- |
| CD45RA+Cyt-      | 200 | 62,934,736 | 54,994,558 | 35,017,566 | 20,640,198 |
| CD45RA+Cyt-      | 200 | 68,135,862 | 59,552,750 | 35,526,346 | 21,086,445 |
| CD45RA+Cyt-      | 200 | 70,826,768 | 61,907,534 | 37,633,502 | 22,213,281 |
| CD45RA_non_sorted| 200 | 68,602,461 | 59,885,416 | 39,839,932 | 23,385,406 |
|                  |     |            |            |            |            |
| CSF+             | 200 | 62,684,598 | 54,763,016 | 34,740,170 | 20,467,855 |
| CSF+             | 200 | 67,455,873 | 59,183,454 | 34,195,690 | 20,201,799 |
| CSF+             | 200 | 77,384,495 | 68,589,338 | 36,762,508 | 21,574,631 |
| CSF+             | 76  | 70,221,073 | 61,069,882 | 34,349,526 | 20,535,774 |
|                  |     |            |            |            |            |
| IFN+             | 200 | 59,019,384 | 52,220,528 | 20,629,422 | 12,573,705 |
| IFN+             | 200 | 70,522,903 | 62,017,526 | 38,567,234 | 22,550,540 |
| IFN+             | 200 | 75,221,322 | 65,974,608 | 37,069,606 | 21,958,915 |
| IFN+             | 76  | 61,592,829 | 54,616,810 | 25,000,494 | 14,887,863 |
| IFN+_only        | 200 | 69,670,672 | 61,124,116 | 34,200,938 | 20,189,447 |
|                  |     |            |            |            |            |
| IL17A+           | 106 | 62,310,684 | 55,454,766 | 15,185,274 |  9,584,108 |
| IL17A+           | 200 | 78,393,511 | 68,992,988 | 34,702,600 | 20,666,285 |
| IL17A+           | 35  | 47,909,489 | 42,749,000 |  9,637,426 |  6,341,500 |
| IL17A+           | 41  | 33,478,324 | 29,799,156 |  6,193,486 |  4,138,692 |
|                  |     |            |            |            |            |
| IL17A+GMCSF+IFN- | 103 | 47,033,855 | 41,582,474 | 11,243,396 |  7,154,241 |
| IL17A+GMCSF+IFN- | 200 | 58,098,730 | 51,781,252 | 32,145,574 | 18,511,109 |
| IL17A+GMCSF+IFN- | 22  | 18,584,017 | 16,637,880 |  7,456,076 |  4,460,148 |


Plots with general statistics:

|     |     |
| --- | --- |
| ![alt text](https://github.com/jknightlab/hussein_rnaseq/blob/master/sequenced_reads.png) |   ![alt text](https://github.com/jknightlab/hussein_rnaseq/blob/master/mapped_reads.png) |
| ![alt text](https://github.com/jknightlab/hussein_rnaseq/blob/master/mapped_reads_nodup.png) |   ![alt text](https://github.com/jknightlab/hussein_rnaseq/blob/master/reads_mapped_to_known_exons.png)|



### Expression of control genes

Samples with less than 6 mln mapped non-duplicate reads were not
considered for this analysis. *Outliar* samples (sample 11 and
sample 15) were not considered for this analysis either. Expression
was calculated as read counts normalized for the number of reads
mapped without duplicates.

- `CSF2`, Ensembl ID `ENSG00000164400.4` should be expressed in GM-CSF cells (CSF+ samples and
IL17A+GMCSF+IFN- samples);
- `IL17A`, Ensembl ID `ENSG00000112115.5` should be expressed in IL17A+ cells (IL17A+ samples and
IL17A+GMCSF+IFN- samples);
- `IFNG`, Ensembl ID `ENSG00000027697.8` should be expressed in IFN+ samples;
- `PTPRC`, Ensembl ID `ENSG00000081237.14` should be expressed in all cells.

(last columncontains the data for IL17A+GMCSF+IFN- samples)
![alt text](https://github.com/jknightlab/hussein_rnaseq/blob/master/controls_expression_outliars_VS_no_outliars.png)


### Differential gene expression

Number of reads mapped to known genes was calculated with
[HTSeq](http://www-huber.embl.de/users/anders/HTSeq/doc/count.html)
on the sorted bam files without duplcates using
[GENCODE](http://www.gencodegenes.org/releases/19.html)
Ensembl annotation.

```
htseq-count --format=bam --stranded=reverse input.bam annotation
```

The number of reads mapped to known exons was relatively low -- around
60% of the number of mapped reads (after removing duplicates). However,
differential expression analysis was still performed. The reason behind
the low fraction of reads mapping to known exons remains unknown but is
most probably due to a falty kit used to prepare total RNA for mRNA
sequencing (Sequencing Core of WTCHG is investigating it at the moment).

An `R` package `edgeR` was used for the differential gene expression
analysis (DGE).

**Number of differentially expressed genes**

|                  | IL17A+GMCSF+IFN- | IL17A+ | IFN+ | CSF+ |
| ---------------- | ---------------- | ------ | ---- | ---- |
| CD45RA+Cyt-      | 121              | 208    | 170  | 100  |
| CSF+             | 1                | 3      |  2   |      |
| IFN+             | 10               | 12     |      |      |
| IL17A+           | 4                |        |      |      |


### Updated DGE analysis

1) Removing ouliars (samples having low number of reads):
```
KNI1766A285	WTCHG_218577_217	Sample:17	IL17A+
KNI1766A287	WTCHG_218577_219	Sample:19	IL17A+GMCSF+IFN-
```

2) Selecting genes with at least 100 reads mapped across all samples.
This step is done to get rid of all zero-count lines, which will
otherwise be considered as observations and will increase the FDR.
This left us with **14,864** expressed genes.

3) Running [`DESeq`](https://github.com/jknightlab/hussein_rnaseq/blob/master/DESeq_code.R)
to get lists of differentially expressed genes.


Out of 14,864 expressed genes we have the following amount of differentially expressed genes.

**FDR < 0.05**

|                  | IL17A+GMCSF+IFN- | IL17A+ | IFN+ | CSF+  |
| ---------------- | ---------------- | ------ | ---- | ----- |
| CD45RA+Cyt-      | 1174             | 460    | 991  | 1311  |
| CSF+             | 10               | 2      | 53   |       |
| IFN+             | 203              | 42     |      |       |
| IL17A+           | 3                |        |      |       |


**P-value < 0.01 (this will be used for the pathway analysis):**

|                  | IL17A+GMCSF+IFN- | IL17A+ | IFN+ | CSF+  |
| ---------------- | ---------------- | ------ | ---- | ----- |
| CD45RA+Cyt-      | 1498             | 753    | 1348 | 1676  |
| CSF+             | 172              | 69     | 203  |       |
| IFN+             | 492              | 193    |      |       |
| IL17A+           | 71               |        |      |       |

Lists of differentia




Next thing to do -- overlap of differentially expressed genes.

1) Which are e.g. differences between the naive cells and the stimulated cells which are consistent?
2) These differences -- do they fall in the same pathway?
3) Individual differences -- do they fall in the same or different pathways?
4) 





















