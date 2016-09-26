#' Gene expression signatures of cigarette smoking
#'
#' A dataset containing gene sets from Huan et al., 2016, see source.
#'
#' @format A \code{\link{gset}} object with the following gene sets:
#' \describe{
#'  \item{Top 25 genes current vs. never smokers}{}
#'  \item{Top 25 genes former vs. never smokers}{}
#' }
#' @source Huan T, Joehanes R, Schurmann C, Schramm K, Pilling LC, Peters MJ, et al.
#' A Whole-Blood Transcriptome Meta-Analysis Identifies Gene Expression Signatures of
#' Cigarette Smoking. Hum Mol Genet. 2016 Aug 29
#'
#' @seealso \code{\link{gset}}
#' @examples
#' data(smoking)
#' smoking[1]
"smoking"


#' Gene expression signatures of stress
#'
#' A dataset containing 15 gene sets thought to be predictors of stress
#' from the following studies:
#' \describe{
#'  \item{Kuebler et al., 2015}{One gene set}
#'  \item{Powell et al., 2013}{Two gene sets}
#'  \item{Antoni et al., 2012}{Four gene sets}
#'  \item{Kawai et al., 2007}{Seven gene sets}
#'  \item{Morita et al., 2005}{One gene set}
#' }
#' For details, see sources below, as well as \code{stress$names} and
#' \code{stress$descriptions}.
#'
#' @format A \code{\link{gset}} object.
#' @source U. Kuebler, C. Zuccarella-Hackl, A. Arpagaus, J. M. Wolf, F. Farahmand, R. von Känel, U. Ehlert, and P. H. Wirtz, “Stress-induced modulation of NF-κB activation, inflammation-associated gene expression, and cytokine levels in blood of healthy men,” Brain. Behav. Immun., vol. 46, pp. 87–95, 2015.
#' @source N. D. Powell, E. K. Sloan, M. T. Bailey, J. M. G. Arevalo, G. E. Miller, E. Chen, M. S. Kobor, B. F. Reader, J. F. Sheridan, and S. W. Cole, “Social stress up-regulates inflammatory gene expression in the leukocyte transcriptome via β-adrenergic induction of myelopoiesis.,” Proc. Natl. Acad. Sci. U. S. A., vol. 110, no. 41, pp. 16574–9, Oct. 2013.
#' @source M. H. Antoni, S. K. Lutgendorf, B. Blomberg, C. S. Carver, S. Lechner, A. Diaz, J. Stagl, J. M. G. Arevalo, and S. W. Cole, “Cognitive-Behavioral Stress Management Reverses Anxiety-Related Leukocyte Transcriptional Dynamics,” Biol. Psychiatry, vol. 71, no. 4, pp. 366–372, 2012.
#' @source T. Kawai, K. Morita, K. Masuda, K. Nishida, M. Shikishima, M. Ohta, T. Saito, and K. Rokutan, “Gene expression signature in peripheral blood cells from medical students exposed to chronic psychological stress.,” Biol. Psychol., vol. 76, no. 3, pp. 147–55, Oct. 2007.
#' @source K. Morita, T. Saito, M. Ohta, T. Ohmori, K. Kawai, S. Teshima-Kondo, and K. Rokutan, “Expression analysis of psychological stress-associated genes in peripheral blood leukocytes.,” Neurosci. Lett., vol. 381, no. 1–2, pp. 57–62, 2005.
#'
#' @encoding UTF8
#'
#' @seealso \code{\link{gset}}
#' @examples
#' data(stress)
#' stress$names
#' stress[1]
"stress"

