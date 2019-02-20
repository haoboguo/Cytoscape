rm(list=ls())
#options(echo=TRUE)
#args <- commandArgs(trailingOnly=TRUE)
#infile <- args[1]
#outfile <- args[1]
#first <- args[3]
#last <- args[4]

first = 423
last = 1000
## read the trap file
trap.file <- read.csv("traps.csv", header=T, stringsAsFactors=F)
image.num <- trap.file$Image_num[first:last]
total.cells <- trap.file$total_cells[first:last]
cell.num <- trap.file$cell_num[first:last]

## mother tree
mother.num <- image.num[which(cell.num == 1)]
tree <- c()
mm1 <- paste(mother.num[1]-1, ".1", " pp ", mother.num[1], ".1", sep="")
tree <- rbind(tree, mm1)
for (i in 1:(length(mother.num)-1)) {
    pp <- paste(mother.num[i],".1", " pp ", mother.num[i]+1, ".1", sep="")
    tree <- rbind(tree, pp)
}

daughter.num <- image.num[which(cell.num == 2)]

#the first mother-to-daughter
md1 <- paste(daughter.num[1]-1, ".1", " pp ", daughter.num[1], ".2", sep="")
tree <- rbind(tree, md1)

#daughters
for (k in 1:(length(daughter.num) -1 )) {
  dnuma <- daughter.num[k+1]
  dnumb <- daughter.num[k]+1
  if (dnuma == dnumb) {
     dd <- paste(daughter.num[k+1], ".2", " pp ", daughter.num[k], ".2", sep="")
     tree <- rbind(tree, dd)
  } else {
     md <- paste(daughter.num[k+1] - 1, ".1", " pp ", daughter.num[k+1], ".2", sep="")
     tree <- rbind(tree, md)
  }
}

write.table(tree, file="test.sif", row.names=F, col.names = F, quote = F)
