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

