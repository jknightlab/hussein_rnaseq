data <- read.table("gene_expression.norm_nodup.txt", header=TRUE, sep='\t')

pdf("gene_expression.per_page.pdf", width = 20, height = 10)

par(mar=c(4,6,5,3))
boxplot(as.integer(data[1, seq(1,4)]), 
        as.integer(data[1, seq(9,13)]), 
        as.integer(data[1, seq(5,8)]), 
        as.integer(data[1, seq(14,6)]), 
        as.integer(data[1, seq(17,18)]), 
        names=c("CD45RA+Cyt+", "IFN+", "GMCSF+", "IL17A+", "IL17A+GMCSF+IFN-"), 
        main="IL17A", ylab="Normalized counts", 
        cex.axis=2, cex.lab=2.5, cex.main=3.5)

boxplot(as.integer(data[2, seq(1,4)]),  
        as.integer(data[2, seq(9,13)]), 
        as.integer(data[2, seq(5,8)]), 
        as.integer(data[2, seq(14,6)]), 
        as.integer(data[2, seq(17,18)]), 
        names=c("CD45RA+Cyt+", "IFN+", "GMCSF+", "IL17A+", "IL17A+GMCSF+IFN-"), 
        main="IFNG", 
        ylab="Normalized counts", 
        cex.axis=2, cex.lab=2.5, cex.main=3.5)

boxplot(as.integer(data[3, seq(1,4)]), 
        as.integer(data[3, seq(9,13)]), 
        as.integer(data[3, seq(5,8)]), 
        as.integer(data[3, seq(14,6)]), 
        as.integer(data[3, seq(17,18)]), 
        names=c("CD45RA+Cyt+", "IFN+", "GMCSF+", "IL17A+", "IL17A+GMCSF+IFN-"), 
        main="CSF2", ylab="Normalized counts", 
        cex.axis=2, cex.lab=2.5, cex.main=3.5)

boxplot(as.integer(data[4, seq(1,4)]), 
        as.integer(data[4, seq(9,13)]), 
        as.integer(data[4, seq(5,8)]), 
        as.integer(data[4, seq(14,6)]), 
        as.integer(data[4, seq(17,18)]), 
        names=c("CD45RA+Cyt+", "IFN+", "GMCSF+", "IL17A+", "IL17A+GMCSF+IFN-"), 
        main="RORC", ylab="Normalized counts", 
        cex.axis=2, cex.lab=2.5, cex.main=3.5)

boxplot(as.integer(data[5, seq(1,4)]), 
        as.integer(data[5, seq(9,13)]), 
        as.integer(data[5, seq(5,8)]), 
        as.integer(data[5, seq(14,6)]), 
        as.integer(data[5, seq(17,18)]), 
        names=c("CD45RA+Cyt+", "IFN+", "GMCSF+", "IL17A+", "IL17A+GMCSF+IFN-"), 
        main="TBX21", ylab="Normalized counts", 
        cex.axis=2, cex.lab=2.5, cex.main=3.5)

boxplot(as.integer(data[6, seq(1,4)]), 
        as.integer(data[6, seq(9,13)]), 
        as.integer(data[6, seq(5,8)]), 
        as.integer(data[6, seq(14,6)]), 
        as.integer(data[6, seq(17,18)]), 
        names=c("CD45RA+Cyt+", "IFN+", "GMCSF+", "IL17A+", "IL17A+GMCSF+IFN-"), 
        main="PTPRC", ylab="Normalized counts", 
        cex.axis=2, cex.lab=2.5, cex.main=3.5)

dev.off()

