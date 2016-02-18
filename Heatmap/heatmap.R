library(reshape2)
library(gplots)

genes <- read.table("gene_expression.txt", header=TRUE, sep='\t', row.names=1)
genes.M <- as.matrix(genes)
genes.M <- t(scale(t(genes.M)))
my_palette <- colorRampPalette(c("royalblue", "honeydew"))(n = 500)
hr <- hclust(as.dist(1-cor(t(genes.M), method="pearson")), method="complete")
hc <- hclust(as.dist(1-cor(genes.M, method="spearman")), method="complete")

pdf("gene_expression.clustered.heatmap.pdf", width=20, height=20)
heatmap.2(genes.M, Rowv=as.dendrogram(hr), Colv=as.dendrogram(hc), scale="row", density.info="none", trace="none", margins = c(14, 1), main=" ", tracecol=NA, col=my_palette)
dev.off()

## larger font size

heatmap.2(genes.M, Rowv=as.dendrogram(hr), Colv=as.dendrogram(hc), scale="row", density.info="none", trace="none", margins = c(14, 1), main=" ", tracecol=NA, col=my_palette, cexCol=1.5)

