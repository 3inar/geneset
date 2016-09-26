#' Filter gene set by size of set
#'
#' Removes gene sets smaller than \code{min}, larger than \code{max} from the input
#' gene set \code{gset} object. By default does no filtering.
#
#' @param geneset a \code{gset} object
#' @param min the smallest size of gene set to keep in the list
#' @param max the largest size of gene set to keep in the list (defaults to
#' infinity)
#'
#' @return A \code{gset} object
#' @seealso \code{\link{gset}}
#'
#' @export
gsfilter <- function(geneset, min=0, max=Inf) {
  stopifnot(is.numeric(min), is.numeric(max))
  stopifnot(class(geneset) == "gset")

  lengths <- plyr::laply(geneset$genesets, length)
  inside <- lengths >= min & lengths <= max
  geneset[inside]
}