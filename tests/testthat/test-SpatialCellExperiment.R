context("SpatialCellExperiment")

test_that("SpatialCellExperiment constructor works", {

    out <- SpatialCellExperiment(
        assays=list(counts=u, logcounts=v),
        spatialDim=coordinates)

    expect_s4_class(out, "SpatialCellExperiment")
})

test_that("SpatialCellExperiment constructor with empty coordinates", {

    out <- SpatialCellExperiment(assays=list(counts=u, logcounts=v))

    expect_identical(dim(spatialDim(out)), c(ncol(out), 0L))

})
