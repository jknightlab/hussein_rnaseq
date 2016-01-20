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


**Gens common for the response of double positives and CSF+**

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
analysis software -- [PANTHER](http://pantherdb.org/).


### Pathway analysis with PANTHER

[PANTHER](http://pantherdb.org/) is another online available web server
commonly used to perform pathway analysis. It provides several services:
classification of genes based on their molecular function, biological function,
protein class and pathway; and performing enrichment analysis to pinpoint at
the pathways up/downregulated compaired to the background signal. Note that
"molecular annotation" and "biological function" provides very broad
classification; "pathway" gives a more detailed overview.

Unfortunately enrichment analysis did not identify any significant pathways.
This means that:

- no single specific pathway has more differentially expressed genes than other
  pathway;
- none of the pathways are overall up- or down-regulated compared to the
  background noise.

In other words, none of the pathways is dramatically influenced by differential
gene expression.

Nevertheless, we still looked at the distribution of differentially expressed
genes across different categories. Bar graphs below represent the percentage of
genes (of the total number of differentially expessed genes) falling in each
category.


| Biological process | Molecular function |
| ------------------ | ------------------ |
| ![alt text](https://github.com/jknightlab/hussein_rnaseq/blob/master/Naive_vs_CSF_IL17A_doubles/Panther/panther.biol_process.png) | ![alt text](https://github.com/jknightlab/hussein_rnaseq/blob/master/Naive_vs_CSF_IL17A_doubles/Panther/panther.molecular_funct.png) |

| Protein class |
| ------------------ |
| ![alt text](https://github.com/jknightlab/hussein_rnaseq/blob/master/Naive_vs_CSF_IL17A_doubles/Panther/panther.protein_class.png) |

From the bar plots we can see no significant difference between CSF+ and
IL17A+CSF+IFN-; neither any large difference between DE genes unique for
CSF+/IL17A+CSF+IFN- vs genes common in the response of both cell types. The
biggest differences between the number of genes representing protein classes
are present in broad non-specific classes, such as "hydrolaze" or "enzyme
modulators".

The following table contains a list of pathways; the number of genes within
each pathway is really small (1-5 max), and "YES" means that at least one gene
from a certain pathway was identified. Unfortunately the changes are very
subtle, however, from this table we can see which pathways are preent
specificly in the list of response genes unique for CSF+, unique for
IL17A+CSF+IFN- or common for both cell lines.

| Pathway                               | both | CSF+ | IL17A+CSF+IFN- |
|:-------------------------------------:| ---- | ---- | -------------- |
| Alzheimer disease-presenilin pathway (P00004) | YES | YES | YES |
| CCKR signaling map (P06959) | YES | YES | YES |
| Cholesterol biosynthesis (P00014) | YES | YES | YES |
| Gonadotropin releasing hormone receptor pathway (P06664) | YES | YES | YES |
| Heterotrimeric G-protein signaling pathway-Gi alpha and Gs alpha mediated pathway (P00026) | YES | YES | YES |
| Huntington disease (P00029) | YES | YES | YES |
| Integrin signalling pathway (P00034) | YES | YES | YES |
| Interleukin signaling pathway (P00036) | YES | YES | YES |
| PDGF signaling pathway (P00047) | YES | YES | YES |
| TGF-beta signaling pathway (P00052) | YES | YES | YES |
| Wnt signaling pathway (P00057) | YES | YES | YES |
| Blood coagulation (P00011) | YES | YES | - |
| Cadherin signaling pathway (P00012) | YES | YES | - |
| Glutamine glutamate conversion (P02745) | YES | YES | - |
| p53 pathway by glucose deprivation (P04397) | YES | YES | - |
| Vitamin D metabolism and pathway (P04396) | YES | YES | - |
| Cytoskeletal regulation by Rho GTPase (P00016) | YES | - | YES |
| De novo purine biosynthesis (P02738) | YES | - | YES |
| FAS signaling pathway (P00020) | YES | - | YES |
| Histamine H1 receptor mediated signaling pathway (P04385) | YES | - | YES |
| p53 pathway (P00059) | YES | - | YES |
| Alpha adrenergic receptor signaling pathway (P00002) | YES | - | - |
| Alzheimer disease-amyloid secretase pathway (P00003) | YES | - | - |
| Aminobutyrate degradation (P02726) | YES | - | - |
| Circadian clock system (P00015) | YES | - | - |
| DNA replication (P00017) | YES | - | - |
| Gamma-aminobutyric acid synthesis (P04384) | YES | - | - |
| Glycolysis (P00024) | YES | - | - |
| Ionotropic glutamate receptor pathway (P00037) | YES | - | - |
| N-acetylglucosamine metabolism (P02756) | YES | - | - |
| O-antigen biosynthesis (P02757) | YES | - | - |
| p38 MAPK pathway (P05918) | YES | - | - |
| Plasminogen activating cascade (P00050) | YES | - | - |
| Pyrimidine Metabolism (P02771) | YES | - | - |
| 5HT2 type receptor mediated signaling pathway (P04374) | - | YES | YES |
| Adenine and hypoxanthine salvage pathway (P02723) | - | YES | YES |
| Angiogenesis (P00005) | - | YES | YES |
| Apoptosis signaling pathway (P00006) | - | YES | YES |
| B cell activation (P00010) | - | YES | YES |
| Cortocotropin releasing factor receptor signaling pathway (P04380) | - | YES | YES |
| Dopamine receptor mediated signaling pathway (P05912) | - | YES | YES |
| EGF receptor signaling pathway (P00018) | - | YES | YES |
| FGF signaling pathway (P00021) | - | YES | YES |
| Heme biosynthesis (P02746) | - | YES | YES |
| Heterotrimeric G-protein signaling pathway-Gq alpha and Go alpha mediated pathway (P00027) | - | YES | YES |
| Inflammation mediated by chemokine and cytokine signaling pathway (P00031) | - | YES | YES |
| Nicotinic acetylcholine receptor signaling pathway (P00044) | - | YES | YES |
| Oxytocin receptor mediated signaling pathway (P04391) | - | YES | YES |
| Ras Pathway (P04393) | - | YES | YES |
| Serine glycine biosynthesis (P02776) | - | YES | YES |
| T cell activation (P00053) | - | YES | YES |
| Thyrotropin-releasing hormone receptor signaling pathway (P04394) | - | YES | YES |
| Ubiquitin proteasome pathway (P00060) | - | YES | YES |
| 2-arachidonoylglycerol biosynthesis (P05726) | - | YES | - |
| 5HT1 type receptor mediated signaling pathway (P04373) | - | YES | - |
| 5HT3 type receptor mediated signaling pathway (P04375) | - | YES | - |
| 5HT4 type receptor mediated signaling pathway (P04376) | - | YES | - |
| Axon guidance mediated by Slit/Robo (P00008) | - | YES | - |
| Beta1 adrenergic receptor signaling pathway (P04377) | - | YES | - |
| Beta2 adrenergic receptor signaling pathway (P04378) | - | YES | - |
| Beta3 adrenergic receptor signaling pathway (P04379) | - | YES | - |
| Formyltetrahydroformate biosynthesis (P02743) | - | YES | - |
| Insulin/IGF pathway-mitogen activated protein kinase kinase/MAP kinase cascade (P00032) | - | YES | - |
| JAK/STAT signaling pathway (P00038) | - | YES | - |
| Muscarinic acetylcholine receptor 2 and 4 signaling pathway (P00043) | - | YES | - |
| Notch signaling pathway (P00045) | - | YES | - |
| Opioid prodynorphin pathway (P05916) | - | YES | - |
| Opioid proenkephalin pathway (P05915) | - | YES | - |
| Opioid proopiomelanocortin pathway (P05917) | - | YES | - |
| Pentose phosphate pathway (P02762) | - | YES | - |
| PI3 kinase pathway (P00048) | - | YES | - |
| Purine metabolism (P02769) | - | YES | - |
| Synaptic vesicle trafficking (P05734) | - | YES | - |
| Xanthine and guanine salvage pathway (P02788) | - | YES | - |
| Angiotensin II-stimulated signaling through G proteins and beta-arrestin (P05911) | - | - | YES |
| Axon guidance mediated by netrin (P00009) | - | - | YES |
| Cell cycle (P00013) | - | - | YES |
| Endothelin signaling pathway (P00019) | - | - | YES |
| GABA-B receptor II signaling (P05731) | - | - | YES |
| Heterotrimeric G-protein signaling pathway-rod outer segment phototransduction (P00028) | - | - | YES |
| Hypoxia response via HIF activation (P00030) | - | - | YES |
| Oxidative stress response (P00046) | - | - | YES |
| p53 pathway feedback loops 2 (P04398) | - | - | YES |
| Parkinson disease (P00049) | - | - | YES |
| Toll receptor signaling pathway (P00054) | - | - | YES |
| VEGF signaling pathway (P00056) | - | - | YES |
| Endogenous cannabinoid signaling (P05730) | - | - | YES |



#### Designed by Irina Pulyakhina irina@well.ox.ac.uk
