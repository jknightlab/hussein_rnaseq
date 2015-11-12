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


| sample_id | sample_name | input_yield | sequenced_reads | mapped_reads | mapped_reads_nodup | reads_mapped_to_exons |
| ---------------- | ----------- | --- | ---------- | ---------- | ---------- | --------- |
| WTCHG_218577_201 | CSF+        | 200 | 40,173,210 | 32,989,166 | 21,101,017 | 6,617,021 |
| WTCHG_218577_206 | CSF+        | 200 | 32,576,304 | 27,057,500 | 19,180,449 | 5,866,103 |
| WTCHG_218577_212 | CSF+        | 200 | 35,053,260 | 28,621,153 | 19,256,351 | 6,126,567 |
| WTCHG_218577_216 | CSF+        | 76  | 37,029,692 | 30,001,807 | 19,634,585 | 6,067,773 |
|                  |             |     |            |            |            |           |
| WTCHG_218577_202 | 17+         | 200 | 40,859,576 | 33,265,627 | 20,517,020 | 6,502,143 |
| WTCHG_218577_207 | 17+         | 106 | 35,143,520 | 27,121,005 | 12,384,130 | 3,544,313 |
| WTCHG_218577_213 | 17+         | 35  | 32,154,448 | 20,947,999 |  8,219,354 | 2,300,508 |
| WTCHG_218577_217 | 17+         | 41  | 24,617,144 | 14,735,810 |  5,270,723 | 1,444,490 |
|                  |             |     |            |            |            |           |
| WTCHG_218577_203 | IFN+        | 200 | 36,854,610 | 30,311,411 | 20,959,603 | 6,707,152 |
| WTCHG_218577_208 | IFN+        | 67  | 34,698,216 | 26,577,388 | 15,884,901 | 4,884,147 |
| WTCHG_218577_214 | IFN+        | 200 | 38,927,282 | 31,949,794 | 20,946,987 | 6,648,301 |
| WTCHG_218577_218 | IFN+        | 200 | 31,559,058 | 25,691,946 | 14,243,085 | 4,344,011 |
| WTCHG_218577_211 | all-IFN+    | 200 | 36,370,218 | 29,927,242 | 19,549,866 | 6,240,346 |
|                  |             |     |            |            |            |           |
| WTCHG_218577_204 | 17+CSF+IFN- | 200 | 30,244,676 | 24,816,286 | 16,931,513 | 5,549,960 |
| WTCHG_218577_209 | 17+CSF+IFN- | 103 | 26,566,806 | 20,469,532 |  9,205,932 | 2,656,030 |
| WTCHG_218577_219 | 17+CSF+IFN- | 22  | 18,885,274 |  8,426,204 |  4,625,853 | 1,390,807 |
|                  |             |     |            |            |            |           |
| WTCHG_218577_205 | 45RA+Cyt-   | 200 | 33,017,564 | 27,061,188 | 19,181,889 | 5,969,109 |
| WTCHG_218577_210 | 45RA+Cyt-   | 200 | 36,548,568 | 30,408,256 | 21,033,443 | 6,431,498 |
| WTCHG_218577_215 | Cyt-        | 200 | 35,542,868 | 29,014,524 | 21,229,271 | 6,807,790 |
| WTCHG_218577_220 | 45RA+Cyt-   | 200 | 35,810,572 | 29,060,863 | 19,982,997 | 6,271,561 |

![alt text](https://github.com/jknightlab/hussein_rnaseq/blob/master/sequenced_reads.png)
![alt text](https://github.com/jknightlab/hussein_rnaseq/blob/master/mapped_reads.png)
![alt text](https://github.com/jknightlab/hussein_rnaseq/blob/master/mapped_reads_nodup.png)
![alt text](https://github.com/jknightlab/hussein_rnaseq/blob/master/input_yield_vs_nodup_reads.png)


### Expression of control genes

Samples with less than 6 mln mapped non-duplicate reads were not
considered for this analysis. *Outliar* samples (sample 11 and
sample 15) were not considered for this analysis either.

`CSF2` should be expressed in GM-CSF cells (CSF+ samples and
IL17A+GMCSF+IFN- samples):

![alt text](https://github.com/jknightlab/hussein_rnaseq/blob/master/controls_expression_no_outliars_CSF2.png)

`IL17A+` should be expressed in IL17A+ cells (IL17A+ samples and
IL17A+GMCSF+IFN- samples):

![alt text](https://github.com/jknightlab/hussein_rnaseq/blob/master/controls_expression_no_outliars_IL17A.png)

`IFN+` should be expressed in IFN+ samples:

![alt text](https://github.com/jknightlab/hussein_rnaseq/blob/master/controls_expression_no_outliars_IFNg.png)

`PTPRC` should be expressed in all cells:

![alt text](https://github.com/jknightlab/hussein_rnaseq/blob/master/controls_expression_no_outliars_PTPRC.png)


