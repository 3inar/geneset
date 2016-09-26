#' Gene set/gene list intersect
#'
#' Returns the set intersection between each gene set in a \code{gset} and
#' a list of gene names. Useful for stripping gene sets of genes that aren't
#' in your own data. If any of the gene sets have no genes in common with the
#' \code{genenames} argument, they will be removed and a warning will be shown.
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
  emptyset <- plyr::laply(filtered, function(x) { length(x) == 0})

  if (any(emptyset)) {
    emptynames <- geneset$names[emptyset]
    warning("the following ", length(emptynames), " gene set(s) have an empty intersection and will be removed:\n",
            emptynames)
    geneset <- geneset[!emptyset]
  }


  geneset
}