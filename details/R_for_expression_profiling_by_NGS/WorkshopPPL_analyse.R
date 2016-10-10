## try http:// if https:// URLs are not supported
source("http://bioconductor.org/biocLite.R")
biocLite()

biocLite("Rbowtie")
biocLite("limma")
biocLite("edgeR")

## biocLite("BitSeq")

### 1) Alignments read to the genome/transcriptome

## Bowtie R wrapper - tool for read alignment
library(Rbowtie)
bowtie_build_usage()

refFiles <- dir(system.file(package="Rbowtie", "samples", "refs"), full=TRUE)
indexDir <- file.path(tempdir(), "refsIndex")

tmp <- bowtie_build(references=refFiles, outdir=indexDir, prefix="index", force=TRUE)
head(tmp)

bowtie_usage()

readsFiles <- system.file(package="Rbowtie", "samples", "reads", "reads.fastq")
samFiles <- file.path(tempdir(), "alignments.sam")

bowtie(sequences=readsFiles, 
       index=file.path(indexDir, "index"), 
       outfile=samFiles, sam=TRUE,
       best=TRUE, force=TRUE)
strtrim(readLines(samFiles), 65)
samFiles

## also RSubread (no binaries for Windows)
## for alignment data manipulation Rsamtools

### 2) Expression estimate/profiling
## For genes, exons or junctions can be simple counting the overlapping alignments
## For alternative transcripts more complex task: tools like Cufflinks (no R version)
## or BitSeq

### 3) Differential expression analysis

## differenial expression analysis also in Cufflinks (no R version),
## but also in BitSeq
## library(BitSeq)

## other DEC tools with R bioconductor packages: limma, edgeR, DESeq2
## Sleuth (for data obtained from Kallisto - no R version)

## load data
load(file="PPLabaj_workshop.RData")

## limma
library(limma)

#### transcripts
samples <- substr(colnames(trans.expression), 0,2)
design <- data.frame(OEs=ifelse(samples=="OE",1,0),
                     WTs=ifelse(samples=="WT",1,0))

cm <- makeContrasts(OEvsWT=OEs-WTs,
                    levels=design)

## TMM normalization - from edgeR packaged
dge <- DGEList(counts=trans.expression)
dge <- calcNormFactors(dge)
## voom transformation
v <- voom(dge,design,plot=FALSE)

f.t <- lmFit(v, design)#, method='robust', maxit=9999) 
cf <- contrasts.fit(f.t, cm)
fe <- eBayes(cf, proportion=0.1)

adj.method='BH'
limma.countsTMMvoom.trans <- topTable(fe, number=Inf, adjust.method=adj.method, sort.by='none')
sum(limma.countsTMMvoom.trans$adj.P.Val<0.05)

#### genes
## design and contrasts are the same, there is no need to repeat these steps

## TMM normalization
dge <- DGEList(counts=gene.expression)
dge <- calcNormFactors(dge)
## voom genesformation
v <- voom(dge,design,plot=FALSE)

f.t <- lmFit(v, design)#, method='robust', maxit=9999) 
cf <- contrasts.fit(f.t, cm)
fe <- eBayes(cf, proportion=0.1)

adj.method='BH'
limma.countsTMMvoom.genes <- topTable(fe, number=Inf, adjust.method=adj.method, sort.by='none')
sum(limma.countsTMMvoom.genes$adj.P.Val<0.05)


## plot gene logFC vs corresponding alternative transcripts logFCs
## pairs for gene AT3G01150 highlight with a different colour

plot() ## ...

## edgeR
library(edgeR)

## ...