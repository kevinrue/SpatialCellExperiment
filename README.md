
# SpatialCellExperiment

<!-- badges: start -->
| Platforms |  OS  | R CMD check | Coverage | 
|:----------------:|:----------------:|:----------------:|:----------------:|
| Travis CI | Linux | [![Travis CI build status](https://travis-ci.org/kevinrue/SpatialCellExperiment.svg?branch=master)](https://travis-ci.org/kevinrue/SpatialCellExperiment) | [![Codecov.io coverage status](https://codecov.io/github/kevinrue/SpatialCellExperiment/coverage.svg?branch=master)](https://codecov.io/github/kevinrue/SpatialCellExperiment) |
<!-- badges: end -->

The goal of SpatialCellExperiment is to provide a S4 class for storing data from spatial single-cell experiments.

## Installation

You can install the released version of SpatialCellExperiment from GitHub with:

``` r
devtools::install_github("kevinrue/SpatialCellExperiment")
```

## Example

This is a basic example which shows you how to make an example `SpatialCellExperiment`:

``` r
library(SpatialCellExperiment)
ncells <- 100
u <- matrix(rpois(20000, 5), ncol=ncells)

coordinates <- matrix(runif(ncells*3), ncells)
colnames(coordinates) <- c("x", "y", "z")

sce <- SpatialCellExperiment(assays=list(counts=u), spatialDim=coordinates)
```

