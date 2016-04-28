CSF+			WTCHG_218577_201.htseq_counts WTCHG_218577_206.htseq_counts WTCHG_218577_212.htseq_counts WTCHG_218577_216.htseq_counts
IL17A+			WTCHG_218577_202.htseq_counts WTCHG_218577_207.htseq_counts WTCHG_218577_213.htseq_counts WTCHG_218577_217.htseq_counts
INF+			WTCHG_218577_203.htseq_counts WTCHG_218577_208.htseq_counts WTCHG_218577_214.htseq_counts WTCHG_218577_218.htseq_counts
IL17A+GMCSF+IFN-	WTCHG_218577_204.htseq_counts WTCHG_218577_209.htseq_counts WTCHG_218577_219.htseq_counts
CD45RA+Cyt-		WTCHG_218577_205.htseq_counts WTCHG_218577_210.htseq_counts WTCHG_218577_220.htseq_counts

WTCHG_218577_211.htseq_counts (INF+)
WTCHG_218577_215.htseq_counts (CD45RA+Cyt-)

echo -e "gene_id\tCSF+\tCSF+\tCSF+\tCSF+\tIL17A+\tIL17A+\tIL17A+\tINF+\tINF\tINF+\tINF+\tINF+\tIL17A+GMCSF+IFN-\tIL17A+GMCSF+IFN-\tCD45RA+Cyt-\tCD45RA+Cyt-\tCD45RA+Cyt-" >counts_ourliars.txt

paste \
<(awk '{print $0}' WTCHG_218577_201.htseq_counts) \
<(awk '{print $2}' WTCHG_218577_206.htseq_counts) \
<(awk '{print $2}' WTCHG_218577_212.htseq_counts) \
<(awk '{print $2}' WTCHG_218577_216.htseq_counts) \
<(awk '{print $2}' WTCHG_218577_202.htseq_counts) \
<(awk '{print $2}' WTCHG_218577_207.htseq_counts) \
<(awk '{print $2}' WTCHG_218577_213.htseq_counts) \
<(awk '{print $2}' WTCHG_218577_203.htseq_counts) \
<(awk '{print $2}' WTCHG_218577_208.htseq_counts) \
<(awk '{print $2}' WTCHG_218577_214.htseq_counts) \
<(awk '{print $2}' WTCHG_218577_218.htseq_counts) \
<(awk '{print $2}' WTCHG_218577_211.htseq_counts) \
<(awk '{print $2}' WTCHG_218577_204.htseq_counts) \
<(awk '{print $2}' WTCHG_218577_209.htseq_counts) \
<(awk '{print $2}' WTCHG_218577_205.htseq_counts) \
<(awk '{print $2}' WTCHG_218577_210.htseq_counts) \
<(awk '{print $2}' WTCHG_218577_220.htseq_counts) \
<(awk '{print $2}' WTCHG_218577_215.htseq_counts) \
>> counts_ourliars.txt


~ <(awk '{print $2}' WTCHG_218577_211.htseq_counts) \
~ <(awk '{print $2}' WTCHG_218577_215.htseq_counts)



library("DESeq")
countsTable <- read.delim("counts_no_ourliars.txt", header=TRUE)
rownames(countsTable) <- countsTable$mirna
countsTable <- countsTable[,-1]
conds <- factor(c("CSF+", "CSF+", "CSF+", "CSF+", "IL17A+", "IL17A+", "IL17A+", "INF+", "INF+", "INF+", "INF+", "IL17A+GMCSF+IFN-", "IL17A+GMCSF+IFN-", "CD45RA+Cyt-", "CD45RA+Cyt-"))
cds <- newCountDataSet(countsTable, conds)
cds <- estimateSizeFactors(cds)
cds <- estimateDispersions(cds)

plotDispEsts <- function(cds){
 plot(rowMeans(counts(cds, normalized=TRUE)),
 fitInfo(cds)$perGeneDispEsts,
 pch='.', log="xy",
 xlab="mean of normalized counts", ylab="dispersion",
 )
 xg = 10^seq( -.5, 5, length.out=300 )
 lines(xg, fitInfo(cds)$dispFun(xg), col="red")
}
png("dispersion_estimation.png")
plotDispEsts(cds)
dev.off()

res <- nbinomTest(cds, "CSF+", "IL17A+")
png("log_fold_change_CSF+_vs_IL17A+.png")
plotMA(res)
dev.off()
write.table(res, file="diff_expression_CSF+_vs_IL17A+.txt", quote=FALSE, sep="\t", row.names=FALSE)


res <- nbinomTest(cds, "CSF+", "INF+")
png("log_fold_change_CSF+_vs_INF+.png")
plotMA(res)
dev.off()
write.table(res, file="diff_expression_IL17A+_vs_INF+.txt", quote=FALSE, sep="\t", row.names=FALSE)


res <- nbinomTest(cds, "IL17A+", "INF+")
png("log_fold_change_IL17A+_vs_INF+.png")
plotMA(res)
dev.off()
write.table(res, file="diff_expression_IL17A+_vs_INF+.txt", quote=FALSE, sep="\t", row.names=FALSE)



"CSF+", "CSF+", "CSF+", "CSF+", "IL17A+", "IL17A+", "IL17A+", "INF+", "INF+", "INF+", "INF+", "IL17A+GMCSF+IFN-", "IL17A+GMCSF+IFN-", "CD45RA+Cyt-", "CD45RA+Cyt-"


























