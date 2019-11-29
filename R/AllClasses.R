#' @export
#' @rdname SpatialCellExperiment
#' @importClassesFrom SingleCellExperiment SingleCellExperiment
setClass("SpatialCellExperiment",
    contains = "SingleCellExperiment"
)
