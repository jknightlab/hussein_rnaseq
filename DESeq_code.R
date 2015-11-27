library("DESeq")
countsTable <- read.delim("gene_count.noLowQual.above100.txt", header=TRUE)
rownames(countsTable) <- countsTable$mirna
countsTable <- countsTable[,-1]
conds <- factor(c("CD45RA+Cyt-", "CD45RA+Cyt-", "CD45RA+Cyt-", "CD45RA+Cyt-", "CSF+", "CSF+", "CSF+", "CSF+", "IFN+", "IFN+", "IFN+", "IFN+", "IFN+", "IL17A+", "IL17A+", "IL17A+", "IL17A+GMCSF+INF-", "IL17A+GMCSF+INF-"))
cds <- newCountDataSet(countsTable, conds)
cds <- estimateSizeFactors(cds)
cds <- estimateDispersions(cds)


res1 <- nbinomTest(cds, "CD45RA+Cyt-", "CSF+")
res2 <- nbinomTest(cds, "CD45RA+Cyt-", "IFN+")
res3 <- nbinomTest(cds, "CD45RA+Cyt-", "IL17A+")
res4 <- nbinomTest(cds, "CD45RA+Cyt-", "IL17A+GMCSF+INF-")

res5 <- nbinomTest(cds, "CSF+", "IFN+")
res6 <- nbinomTest(cds, "CSF+", "IL17A+")
res7 <- nbinomTest(cds, "CSF+", "IL17A+GMCSF+INF-")

res8 <- nbinomTest(cds, "IFN+", "IL17A+")
res9 <- nbinomTest(cds, "IFN+", "IL17A+GMCSF+INF-")

res10 <- nbinomTest(cds, "IL17A+", "IL17A+GMCSF+INF-")


write.table(res1, file="DGE_CD45RA+Cyt-_CSF+.deseq.txt", quote=FALSE, sep="\t", row.names=FALSE)
write.table(res2, file="DGE_CD45RA+Cyt-_IFN+.deseq.txt", quote=FALSE, sep="\t", row.names=FALSE)
write.table(res3, file="DGE_CD45RA+Cyt-_IL17A+.deseq.txt", quote=FALSE, sep="\t", row.names=FALSE)
write.table(res4, file="DGE_CD45RA+Cyt-_IL17A+GMCSF+INF-.deseq.txt", quote=FALSE, sep="\t", row.names=FALSE)

write.table(res5, file="DGE_CSF+_IFN+.deseq.txt", quote=FALSE, sep="\t", row.names=FALSE)
write.table(res6, file="DGE_CSF+_IL17A+.deseq.txt", quote=FALSE, sep="\t", row.names=FALSE)
write.table(res7, file="DGE_CSF+_IL17A+GMCSF+INF-.deseq.txt", quote=FALSE, sep="\t", row.names=FALSE)


write.table(res8, file="DGE_IFN+_IL17A+.deseq.txt", quote=FALSE, sep="\t", row.names=FALSE)
write.table(res9, file="DGE_IFN+_IL17A+GMCSF+INF-.deseq.txt", quote=FALSE, sep="\t", row.names=FALSE)

write.table(res10, file="DGE_IL17A+_IL17A+GMCSF+INF-.deseq.txt", quote=FALSE, sep="\t", row.names=FALSE)
