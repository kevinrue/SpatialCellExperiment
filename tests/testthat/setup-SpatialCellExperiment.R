
ncells <- 100
u <- matrix(rpois(20000, 5), ncol=ncells)
v <- log2(u + 1)

coordinates <- matrix(runif(ncells*3), ncells)
