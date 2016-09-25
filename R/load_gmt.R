#' Read a \code{.gmt} file
#'
#' Reads a file of the Gene Matrix Transposed file format.
#'
#' @param file the name of the file you want to read
#'
#' @return An object of class \code{gset} with the following elements:
#'  \item{names}{a character vector containing gene set names}
#'  \item{descriptions}{a character vector containing gene set descriptions}
#'  \item{genesets}{a list of character vectors containing gene symbols}
#' @export
load_gmt <- function(file)
{
  sets <- scan(file=file, what=character(), sep='\n', multi.line=F, quiet=T)
  sets <- stringr::str_split(sets, '\t')

  gsnames <- plyr::laply(sets, function(x) { x[1] })
  gsdescriptions <- plyr::laply(sets, function(x) { x[2] })
  gsets <- plyr::llply(sets, function(x) { x[3:length(x)] })

  gset(gsnames, gsdescriptions, gsets)
}