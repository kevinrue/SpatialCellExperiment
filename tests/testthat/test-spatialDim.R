context("spatialDim")

test_that("spatialDim works", {

    colnames(coordinates) <- c("x", "y", "z")

    sce <- SpatialCellExperiment(
        assays=list(counts=u, logcounts=v),
        spatialDim=coordinates
    )

    out <- spatialDim(sce)

    expect_identical(out, coordinates)
})

test_that("spatialDim adds default colnames if missing", {

    colnames(coordinates) <- NULL

    sce <- SpatialCellExperiment(
        assays=list(counts=u, logcounts=v),
        spatialDim=coordinates
    )

    out <- spatialDim(sce)

    expect_identical(colnames(spatialDim(sce)), c("1", "2", "3"))
})

test_that("spatialDimNames<- works", {

    sce <- SpatialCellExperiment(
        assays=list(counts=u, logcounts=v),
        spatialDim=coordinates
    )

    spatialDimNames(sce) <-  c("x", "y", "z")

    expect_identical(colnames(spatialDim(sce)), c("x", "y", "z"))
})
