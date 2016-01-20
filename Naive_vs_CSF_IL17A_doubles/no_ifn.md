Pathway analysis
--------------------------------------

Part 2

For Part 1 of the analysis click
[here](https://github.com/jknightlab/hussein_rnaseq/blob/master/Workflow_simplified.md).
Part 1 contains the information about the upstream analysis, finding
differentially expressed (DE) genes and comparing DE genes from different cell
lines to each other.


### Pathway analysis with DAVID

A web service [DAVID](https://david.ncifcrf.gov/) was used to perform pathway
analysis. It require the actual gene list to be tested and the background
expression to model the background signal and to distinguish between the actual
fluctuations in expression and the noise in a better way. "Background signal"
means the full list of expressed genes (and DGE list will be compared to the
full list). Background genes need to be cell-type specific, as not all genes
are expressed in all cell types. Therefore background gene list will be
different for each comparison. However, running pathway analysis with such
restricted background did not produce any significant results, most probably
due to the limitedness of the list. Therefore all human genes were used as
background.

Results of DAVID pathway analysis can be found here:

- for the genes unique for [CSF+](https://github.com/jknightlab/hussein_rnaseq/blob/master/Naive_vs_CSF_IL17A_doubles/CSF_unique.pathway.txt);
- for the genes unique for [double positives](https://github.com/jknightlab/hussein_rnaseq/blob/master/Naive_vs_CSF_IL17A_doubles/Double_unique.pathway.txt);
- for the genes common for [both cell types](https://github.com/jknightlab/hussein_rnaseq/blob/master/Naive_vs_CSF_IL17A_doubles/CSF_double.pathway.txt).

Here is a brief summary -- a list of pathways, numbers of genes representing
each pathway, fold enrichment and a P-value adjusted using Benjamini-Hochberg
method.

Only eight pathways for the genes unique for CSF+ were identified as influenced
with a stringent p-value cut-off.  Only two pathways for the genes common for
CSF+ and double positives were identified as influenced with a stringent
p-value cut-off.  None of the pathways for the genes unique for double
positives were identified as influenced with a stringent p-value cut-off.


**Genes unique for CSF+ response to the naive cell line**

| Pathway  | Number of genes | P-value | Fold enrichment | Adj. p-value |
| ------------------------------------------- | --- | -------- | ----- | -------- |
| phosphoprotein                              | 221 | 1.594E-9 | 1.377 | 5.915E-7 |
| alternative splicing                        | 214 | 1.168E-6 | 1.293 | 2.168E-4 |
| splice variant                              | 212 | 3.642E-6 | 1.278 | 0.004    |
| positive regulation of cell differentiation | 19  | 7.894E-6 | 3.518 | 0.017    |
| positive regulation of developmental process| 21  | 9.397E-6 | 3.203 | 0.010    |
| GTPase_activation                           | 15  | 1.189E-5 | 4.269 | 0.001    |
| hemopoiesis                                 | 19  | 1.196E-5 | 3.414 | 0.009    |
| hemopoietic_or_lymphoid_organ_development   | 20  | 1.261E-5 | 3.262 | 0.007    |


** Gens common for the response of double positives and CSF+**

| Pathway | Number of genes | P-value | Fold enrichment | Adj. p-value |
| -------------- | --- | -------- | ----- | ----- |
| phosphoprotein | 165 | 2.827E-6 | 1.332 | 0.001 |
| kinase         | 29  | 1.970E-5 | 2.472 | 0.004 |

As the number of pathways was very limited, we also performed pathway analysis
for all response genes of CSF+ and double positives. Here, we used a more
stringent p-value cut-off as we used all DE genes -- **0.005** instead of 0.05.

| CSF+ | IL17A+CSF+IFN- |
| ---- | -------------- |
| ![alt text](https://github.com/jknightlab/hussein_rnaseq/blob/master/Naive_vs_CSF_IL17A_doubles/CSF_all_sign_pathways.png) | ![alt text](https://github.com/jknightlab/hussein_rnaseq/blob/master/Naive_vs_CSF_IL17A_doubles/Double_all_sign_pathway.png) |

From the pathways listed on the bar plots we can see some relevant pathways --
regulation of lymphocyte activation, regulation of leukocyte activation,
cytokine-cytokine receptor interaction. However, a lot of them are very broad,
not specific enough -- immune response, T-cell, immune system development,
cytokine activity. For this reason we decided to try another popular pathway
analysis software -- PANTHER.






#### Designed by Irina Pulyakhina irina@well.ox.ac.uk
