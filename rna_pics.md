Differential gene expression
--------------------------------------

Getting the numbers of mapped reads, sequenced reads, etc:
```
for i in `ls *.dedup.gene.counts.txt | sed s/\.dedup.*//g`
do
    sequenced=`cat $i.flagstat.bam | grep QC | awk '{print $1}'`
    mapped=`cat $i.flagstat.bam | grep properly | grep paired | grep nan | awk '{print $1}'`
    nodup=`cat $i.flagstat.nodup.bam | grep properly | grep paired | grep nan | awk '{print $1}'`
    togenes=`cat $i.dedup.gene.counts.txt | grep ENSG | awk '{sum += $2} END {print sum}'`
    echo -e "$i\t$sequenced\t$mapped\t$nodup\t$togenes"
done | awk '{print $1 "\t" $2 "\t" $3 "\t" ($3*100)/$2 "\t" $4 "\t" ($4*100)/$2 "\t" $5 "\t" ($5*100)/$2 "\t" ($5*100)/$3 "\t" ($5*100)/$4}'
```

| sample_name | #sequenced | #mapped    | %mapped | #nodup     | %nodup  | #to_genes  | %to genes (of sequenced) | % to genes (of mapped) | % to genes (of nodup) |
| ----------- | ---------- | ---------- | ------- | ---------- | ------- | ---------- | ------- | ------- | ------- | 
| KNI1766A269 | 77,384,495 | 68,589,338 | 88.6345 | 36,762,508 | 47.5063 | 15,124,594 | 19.5447 | 22.0509 | 41.1414 |
| KNI1766A270 | 78,393,511 | 68,992,988 | 88.0085 | 34,702,600 | 44.2672 | 14,737,099 | 18.7989 | 21.3603 | 42.4668 |
| KNI1766A271 | 70,522,903 | 62,017,526 | 87.9396 | 38,567,234 | 54.6875 | 16,089,732 | 22.8149 | 25.9438 | 41.7187 |
| KNI1766A272 | 58,098,730 | 51,781,252 | 89.1263 | 32,145,574 | 55.3292 | 13,698,577 | 23.5781 | 26.4547 | 42.6142 |
| KNI1766A273 | 62,934,736 | 54,994,558 | 87.3835 | 35,017,566 | 55.6411 | 14,444,459 | 22.9515 | 26.2653 | 41.2492 |
| KNI1766A274 | 62,684,598 | 54,763,016 | 87.3628 | 34,740,170 | 55.4206 | 13,931,958 | 22.2255 | 25.4405 | 40.1033 |
| KNI1766A275 | 62,310,684 | 55,454,766 | 88.9972 | 15,185,274 | 24.3703 |  6,036,136 | 9.68716 | 10.8848 | 39.7499 |
| KNI1766A276 | 61,592,829 | 54,616,810 | 88.674  | 25,000,494 | 40.5899 | 10,183,233 | 16.5331 | 18.6449 | 40.7321 |
| KNI1766A277 | 47,033,855 | 41,582,474 | 88.4097 | 11,243,396 | 23.9049 |  4,559,628 | 9.69435 | 10.9653 | 40.5538 |
| KNI1766A278 | 70,826,768 | 61,907,534 | 87.407  | 37,633,502 | 53.1346 | 15,135,376 | 21.3696 | 24.4484 | 40.2178 |
| KNI1766A279 | 69,670,672 | 61,124,116 | 87.7329 | 34,200,938 | 49.0894 | 14,335,152 | 20.5756 | 23.4525 | 41.9145 |
| KNI1766A280 | 67,455,873 | 59,183,454 | 87.7365 | 34,195,690 | 50.6934 | 14,296,307 | 21.1936 | 24.1559 | 41.8073 |
| KNI1766A281 | 47,909,489 | 42,749,000 | 89.2287 |  9,637,426 | 20.1159 |  3,836,552 | 8.00792 | 8.9746  | 39.8089 |
| KNI1766A282 | 75,221,322 | 65,974,608 | 87.7073 | 37,069,606 | 49.2807 | 15,421,122 | 20.501  | 23.3743 | 41.6004 |
| KNI1766A283 | 68,602,461 | 59,885,416 | 87.2934 | 39,839,932 | 58.0736 | 16,705,726 | 24.3515 | 27.8962 | 41.9321 |
| KNI1766A284 | 70,221,073 | 61,069,882 | 86.968  | 34,349,526 | 48.9163 | 14,419,124 | 20.5339 | 23.6109 | 41.9777 |
| KNI1766A285 | 33,478,324 | 29,799,156 | 89.0103 |  6,193,486 | 18.5    |  2,516,499 | 7.5168  | 8.44487 | 40.6314 |
| KNI1766A286 | 59,019,384 | 52,220,528 | 88.4803 | 20,629,422 | 34.9536 |  8,405,998 | 14.2428 | 16.0971 | 40.7476 |
| KNI1766A287 | 18,584,017 | 16,637,880 | 89.5279 |  7,456,076 | 40.1209 |  3,103,098 | 16.6977 | 18.6508 | 41.6184 |
| KNI1766A288 | 68,135,862 | 59,552,750 | 87.4029 | 35,526,346 | 52.1405 | 14,774,379 | 21.6837 | 24.8089 | 41.5871 |




Plots with general statistics:

|     |     |
| --- | --- |
| ![alt text](https://github.com/jknightlab/hussein_rnaseq/blob/master/rna_sequenced.png) |   ![alt text](https://github.com/jknightlab/hussein_rnaseq/blob/master/rna_mapped.png) |
|![alt text](https://github.com/jknightlab/hussein_rnaseq/blob/master/rna_mapped_nodup.png) |  ![alt text](https://github.com/jknightlab/hussein_rnaseq/blob/master/rna_mapped_to_genes.png) |

`R` code to create the plots:
```
png("rna_sequenced.png")
par(mar = c(9,4,4,2))
barplot(data$sequenced_reads/1000000, names.arg=data$sample_name, las=2, col="darkslateblue", ylab="sequenced reads, mln", main="Number of sequenced reads", ylim=c(0,82))
dev.off()

png("rna_mapped.png")
par(mar = c(9,4,4,2))
barplot(data$mapped_reads/1000000, names.arg=data$sample_name, las=2, col="darkslateblue", ylab="mapped reads, mln", main="Number of mapped reads", ylim=c(0,82))
dev.off()

png("rna_mapped_nodup.png")
par(mar = c(9,4,4,2))
barplot(data$mapped_reads_nodup/1000000, names.arg=data$sample_name, las=2, col="darkslateblue", ylab="mapped reads, mln", main="Number of mapped reads without duplicates", ylim=c(0,40))
abline(h=10, col="red")
abline(h=20, col="red")
dev.off()

png("rna_mapped_to_genes.png")
par(mar = c(9,4,4,2))
barplot(data$reads_mapped_to_exons/1000000, names.arg=data$sample_name, las=2, col="darkslateblue", ylab="mapped reads, mln", main="Number of reads mapped to known genes", ylim=c(0,40))
abline(h=10, col="red")
dev.off()a
```
