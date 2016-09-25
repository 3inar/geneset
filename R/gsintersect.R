#' Gene set/gene list intersect
#'
#' Returns the set intersection between each gene set in a \code{gset} and
#' a list of gene names. Useful for stripping gene sets of genes that aren't
#' in your own data.
#'
#' @param geneset a \code{gset} object
#' @param genenames A vector of gene symbols that you want to keep in \code{geneset}.
#'
#' @return a \code{gset} object
#' @seealso \code{\link{gset}}
#'
#' @export
gsintersect <- function(geneset, genenames) {
  stopifnot(class(geneset) == "gset")
  stopifnot(is.character(genenames))

  filtered <- plyr::llply(geneset$genesets, intersect, genenames)
  geneset$genesets <- filtered

  geneset
}