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

- `CSF2` should be expressed in GM-CSF cells (CSF+ samples and
IL17A+GMCSF+IFN- samples):
- `IL17A+` should be expressed in IL17A+ cells (IL17A+ samples and
IL17A+GMCSF+IFN- samples):
- `IFN+` should be expressed in IFN+ samples:
- `PTPRC` should be expressed in all cells:

|     |     |
| --- | --- |
| ![alt text](https://github.com/jknightlab/hussein_rnaseq/blob/master/controls_expression_no_outliars_CSF2.png) |   ![alt text](https://github.com/jknightlab/hussein_rnaseq/blob/master/controls_expression_no_outliars_IL17A.png) |
| ![alt text](https://github.com/jknightlab/hussein_rnaseq/blob/master/controls_expression_no_outliars_IFNg.png) |   ![alt text](https://github.com/jknightlab/hussein_rnaseq/blob/master/controls_expression_no_outliars_PTPRC.png)|


### Differential gene expression

Number of reads mapped to known genes was calculated with
[HTSeq](http://www-huber.embl.de/users/anders/HTSeq/doc/count.html)
on the sorted bam files without duplcates.

```
htseq-count --format=bam --stranded=reverse input.bam annotation
```

[GENCODE](http://www.gencodegenes.org/releases/19.html)
Ensembl annotation was used, howeve, the number of reads
mapped to known genes is really low.

| sample name    | mapped reads | mapped to v19 | %mapped to v19| mapped to scaff | mapped to v22|
| ---------------- | ---------- | --------- | ------- | ------- | --------- |
| WTCHG_218577_201 | 21,101,017 | 6,617,021 | 31.3588 | 950,262 | 6,619,097 |
| WTCHG_218577_202 | 20,517,020 | 6,502,143 | 31.6915 | 904,026 | 6,504,396 |
| WTCHG_218577_203 | 20,959,603 | 6,707,152 | 32.0004 | 955,411 | 6,709,549 |
| WTCHG_218577_204 | 16,931,513 | 5,549,960 | 32.7789 | 772,997 | 5,551,398 |
| WTCHG_218577_205 | 19,181,889 | 5,969,109 | 31.1185 | 865,651 | 5,970,719 |
| WTCHG_218577_206 | 19,180,449 | 5,866,103 | 30.5838 | 864,758 | 5,867,853 |
| WTCHG_218577_207 | 12,384,130 | 3,544,313 | 28.6198 | 521,430 | 3,545,293 |
| WTCHG_218577_208 | 15,884,901 | 4,884,147 | 30.7471 | 692,399 | 4,885,620 |
| WTCHG_218577_209 |  9,205,932 | 2,656,030 | 28.8513 | 383,611 | 2,656,871 |
| WTCHG_218577_210 | 21,033,443 | 6,431,498 | 30.5775 | 977,777 | 6,433,832 |
| WTCHG_218577_211 | 19,549,866 | 6,240,346 | 31.9201 | 897,556 | 6,242,143 |
| WTCHG_218577_212 | 19,256,351 | 6,126,567 | 31.8158 | 841,495 | 6,128,624 |
| WTCHG_218577_213 |  8,219,354 | 2,300,508 | 27.9889 | 329,676 | 2,301,415 |
| WTCHG_218577_214 | 20,946,987 | 6,648,301 | 31.7387 | 927,859 | 6,650,266 |
| WTCHG_218577_215 | 21,229,271 | 6,807,790 | 32.0679 | 918,900 | 6,809,935 |
| WTCHG_218577_216 | 19,634,585 | 6,067,773 | 30.9035 | 840,504 | 6,070,445 |
| WTCHG_218577_217 |  5,270,723 | 1,444,490 | 27.4059 | 205,924 | 1,445,089 |
| WTCHG_218577_218 | 14,243,085 | 4,344,011 | 30.4991 | 595,778 | 4,345,603 |
| WTCHG_218577_219 |  4,625,853 | 1,390,807 | 30.066  | 190,958 | 1,391,718 |
| WTCHG_218577_220 | 19,982,997 | 6,271,561 | 31.3845 | 867,748 | 6,273,386 |

The correlation between the number of nodup mapped reads and reads
mapped to known genes is 0.998.

