test_that("show method works", {
    sce <- SpatialCellExperiment(
        assays=list(counts=u, logcounts=v),
        spatialDim=coordinates
    )

    expect_null(show(sce))
})
