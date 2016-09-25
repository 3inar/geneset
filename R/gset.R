#' Build a \code{gset} object
#'
#' Builds an object of class \code{gset}. Basically a list with the following fields:
#' \describe{
#'  \item{names}{character vector of gene set names}
#'  \item{descriptions}{character vector of gene set descriptions}
#'  \item{genesets}{list of character vectors containing gene symbols for each gene set}
#' }
#'
#' @param gsnames character vector of gene set names
#' @param gsdesc character vector of gene set descriptions
#' @param gslist list of character vectors containing gene names
#'
#' @return a \code{gset} object. See above
#' @export
gset <- function(gsnames, gsdesc, gslist) {
  stopifnot(is(gsnames, "character"))
  stopifnot(is(gsdesc, "character"))
  stopifnot(is(gslist, "list"))

  stopifnot(length(gsnames) == length(gsdesc))
  stopifnot(length(gsdesc) == length(gslist))

  gs <- list(names=gsnames, descriptions=gsdesc, genesets=gslist)
  class(gs) <- "gset"

  gs
}

#' @export
`[.gset` <- function(x, i) {
  x$names <- x$names[i]
  x$descriptions <- x$descriptions[i]
  x$genesets <- x$genesets[i]

  x
}

#' @export
length.gset <- function(x) {
  length(x$names)
}