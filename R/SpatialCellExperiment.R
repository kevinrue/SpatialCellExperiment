#' The SingleCellExperiment class
#'
#' @param ... Arguments passed to the [SingleCellExperiment::SingleCellExperiment-class] constructor to fill the slots of the base class.
#' @param spatialDim A matrix of spatial coordinates.
#'
#' @examples
#' ncells <- 100
#' u <- matrix(rpois(20000, 5), ncol=ncells)
#' v <- log2(u + 1)
#'
#' coordinates <- matrix(runif(ncells*3), ncells)
#' colnames(coordinates) <- c("x", "y", "z")
#'
#' sce <- SpatialCellExperiment(assays=list(counts=u, logcounts=v),
#'     spatialDim=coordinates)
#' sce
#'
#' @export
#' @rdname SpatialCellExperiment
#' @importFrom methods new
#' @importFrom SingleCellExperiment SingleCellExperiment
#' @importClassesFrom SingleCellExperiment SingleCellExperiment
SpatialCellExperiment <- function(..., spatialDim=NULL) {
    sce <- SingleCellExperiment(...)
    sce <- new("SpatialCellExperiment", sce)
    spatialDim(sce) <- spatialDim
    sce
}
