#' Gene set/gene list intersect
#'
#' Returns the intersection between each gene set in a gene set list and
#' a list of gene names. Useful for stripping gene sets of genes that aren't
#' in your own data.
#'
#' @param gslist A list of gene sets (character vectors of gene symbols)
#' @param genenames A vector of gene symbols that you want to keep in \code{gslist}.
#'
#' @return A list of gene sets
#'
#' @export
gsintersect <- function(gslist, genenames) {
  stopifnot(is.list(gslist), is.character(genenames))
  plyr::llply(gslist, intersect, genenames)
}