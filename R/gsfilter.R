#' Filter gene set list by size of set
#'
#' Removes gene sets smaller than \code{min}, larger than \code{max} from the input
#' gene set list.
#'
#' @param geneset A list of gene sets (character vectors)
#' @param min the smallest size of gene set to keep in the list
#' @param max the largest size of gene set to keep in the list (defaults to
#' infinity)
#'
#' @return A list of gene sets
#'
#' @export
gsfilter <- function(geneset, min=5, max=Inf) {
  stopifnot(is.numeric(min), is.numeric(max))
  lengths <- plyr::laply(geneset, length)
  inside <- lengths >= min & lengths <= max
  geneset[inside]
}