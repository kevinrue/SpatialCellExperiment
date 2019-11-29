#' @title
#' Miscellaneous SpatialCellExperiment methods
#'
#' @description
#' Miscellaneous methods for the [SpatialCellExperiment-class] class
#' that do not fit in any other documentation category.
#'
#' @section Available methods:
#' In the following code snippets, `x` and `object` are [SpatialCellExperiment-class] objects.
#' \describe{
#' \item{\code{show(object)}:}{Print a message to screen describing the contents of `object`.}
#' }
#'
#' @author Kevin Rue-Albrecht
#'
#' @examples
#' example(SpatialCellExperiment, echo=FALSE) # Using the class example
#'
#' show(sce)
#'
#' @name SCE-miscellaneous
#' @rdname miscellaneous
#' @docType methods
#' @aliases
#' show,SpatialCellExperiment-method
NULL

#' @importFrom methods callNextMethod
#' @importFrom S4Vectors coolcat
.sce_show <- function(object) {
    callNextMethod()
    coolcat("spatialDim(%d): %s\n", spatialDimNames(object))
}

#' @export
setMethod("show", "SpatialCellExperiment", .sce_show)
