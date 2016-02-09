Analysis of Transcription Factors
---------------------------------

For Part 1 of the analysis click
[here](https://github.com/jknightlab/hussein_rnaseq/blob/master/Workflow_simplified.md).
Part 1 contains the information about the upstream analysis, finding
differentially expressed (DE) genes and comparing DE genes from different cell
lines to each other.

To identify Transcription Factors (TFs) in the gene signatures in four
populations, three pure and one double positive, we compared identified genes
the  [AnimalTFDB](http://bioinfo.life.hust.edu.cn/AnimalTFDB/index.shtml).
This database contains both predicted and experimentally validated
transcription factors and is being constantly updated and currated. It consists
of 1,564 TFs.

Our data contains 938 transcription factors, which means that the remaining 626
are not expressed in our cells/specific for other cell types.


#### Transcription factors in gene signatures

We select genes differentially expressed in CSF+ / IL17A+ / IFN+ /
IL17A+CSF+IFN- against the naive cells. Here are the full lists:

- 8.38% (110 out of 1,312) DE genes for [CSF+](https://github.com/jknightlab/hussein_rnaseq/blob/master/TF/CSF+.all_TFs.txt)
 were transcription facters;
- 8.37% (83 out of 992) DE genes for [IFN+](https://github.com/jknightlab/hussein_rnaseq/blob/master/TF/IDF+.all_TFs.txt)
 were transcription facters;
- 6.51% (30 out of 461) DE genes for [IL17A+](https://github.com/jknightlab/hussein_rnaseq/blob/master/TF/IL17A+.all_TFs.txt)
 were transcription facters;
- 7.4% (87 out of 1,175) DE genes for [IL17A+GMCSF+IFN-+](https://github.com/jknightlab/hussein_rnaseq/blob/master/TF/IL17A+GMCSF+IFN-.all_TFs.txt)
 were transcription facters;


We also looked at trancription factors unique in **pure** per cell lines (can
have overlap with IL17A+GMCSF+IFN-):

- 8.56% (37 out of 432) DE genes for [CSF+](https://github.com/jknightlab/hussein_rnaseq/blob/master/TF/CSF+.unique_in_pure.txt)
 were transcription facters;
- 7.06% (13 out of 184) DE genes for [IFN+](https://github.com/jknightlab/hussein_rnaseq/blob/master/TF/IFN+.unique_in_pure.txt)
 were transcription facters;
- 7.41% (2 out of 27) DE genes for [IL17A+](https://github.com/jknightlab/hussein_rnaseq/blob/master/TF/IL17A+.unique_in_pure.txt)
were transcription facters;


We also looked at trancription factors unique across **all** cell lines:

- 8.05% (21 out of 261) DE genes for **CSF+** were transcription facters;
- 6.99% (10 out of 143) DE genes for **IFN+** were transcription facters;
- no (0 out of 3) DE genes for **IL17A+** were transcription facters;
- 7.14%% (20 out of 280) DE genes for **IL17A+GMCSF+IFN-** were transcription facters;

[CSF+](https://github.com/jknightlab/hussein_rnaseq/blob/master/TF/CSF+.unique_in_all.txt)
[IFN+](https://github.com/jknightlab/hussein_rnaseq/blob/master/TF/IFN+.unique_in_all.txt)
[IL17A+](https://github.com/jknightlab/hussein_rnaseq/blob/master/TF/IL17A+.unique_in_all.txt)
[IL17A+GMCSF+IFN-](https://github.com/jknightlab/hussein_rnaseq/blob/master/TF/IL17A+GMCSF+IFN-.unique_in_all.txt)

#### ToDo

Look at transcription factors in genes common between cell lines.



#### Designed by Irina Pulyakhina irina@well.ox.ac.uk