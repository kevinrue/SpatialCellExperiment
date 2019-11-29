#' Reduced dimensions methods
#'
#' Methods to get or set dimensionality reduction results in a [SpatialCellExperiment-class] object.
#' These are typically used to store and retrieve spatial representations of single-cell datasets.
#' Each row of a spatial dimension result is expected to correspond to a column of the SpatialCellExperiment object.
#'
#' @section Getters:
#' In the following examples, `x` is a [SpatialCellExperiment-class] object.
#' \describe{
#' \item{`spatialDim(x, withDimnames=TRUE)`:}{
#' Retrieves the matrix (or matrix-like object) containing spatial dimension coordinates for cells (rows) and dimensions (columns).
#' If `withDimnames=TRUE`, row names of the output matrix are replaced with the column names of `x`.
#' }
#' \item{`spatialDimNames(x)`:}{
#' Returns a character vector containing the colnames the spatial dimensions in `x`.
#' }
#' }
#'
#' @section Setter:
#' `spatialDim(x) <- value` will replace the spatial dimension matrix
#' in a [SpatialCellExperiment-class] object `x`.
#'
#' `value` is expected to be a matrix or matrix-like object with number of rows equal to `ncol(x)`.
#'
#' @section Other setters:
#' In the following examples, `x` is a [SpatialCellExperiment-class] object.
#' \describe{
#' \item{`spatialDimNames(x) <- value`:}{
#' Replaces all colnames for the spatial dimension matrix in `x` with a character vector `value`.
#' }
#' }
#'
#' @author Kevin Rue-Albrecht
#'
#' @examples
#' example(SpatialCellExperiment, echo=FALSE)
#'
#' spatialDim(sce)
#' spatialDimNames(sce)
#'
#' @name spatialDim
#' @docType methods
#' @aliases
#' spatialDim spatialDimNames
#' spatialDim,SpatialCellExperiment-method
#' spatialDimNames,SpatialCellExperiment-method
#' spatialDim<- spatialDimNames<-
#' spatialDim<-,SpatialCellExperiment-method
#' spatialDimNames<-,SpatialCellExperiment,character-method
NULL

.spatial_key <- "spatialDim"

#' @importFrom BiocGenerics updateObject
#' @importFrom SingleCellExperiment int_colData
#' @export
setMethod("spatialDim", c("SpatialCellExperiment"), function(x, withDimnames=TRUE) {
    x <- updateObject(x)
    out <- int_colData(x)[[.spatial_key]]

    if (withDimnames) {
        rownames(out) <- colnames(x)
    }

    out
})

#' @importFrom BiocGenerics updateObject
#' @importFrom SingleCellExperiment int_colData<-
#' @export
setReplaceMethod("spatialDim", "SpatialCellExperiment", function(x, value) {
    x <- updateObject(x)
    if (is.null(value)) {
        value <- matrix(numeric(0), ncol(x), 0L)
    }
    if (is.null(colnames(value))) {
        colnames(value) <- seq_len(ncol(value))
    }
    int_colData(x)[[.spatial_key]] <- value
    x
})

#' @importFrom BiocGenerics updateObject
#' @importFrom SingleCellExperiment int_colData
#' @export
setMethod("spatialDimNames", "SpatialCellExperiment", function(x) {
    x <- updateObject(x)
    colnames(int_colData(x)[[.spatial_key]])
})

#' @importFrom BiocGenerics updateObject
#' @importFrom SingleCellExperiment int_colData
#' @export
setReplaceMethod("spatialDimNames", c("SpatialCellExperiment", "character"), function(x, value) {
    x <- updateObject(x)
    colnames(int_colData(x)[[.spatial_key]]) <- value
    x
})
