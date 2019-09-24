#' R Markdown Output Formats
#'
#' A number of additional \code{yaml} options are made available:
#' \describe{
#'     \item{tikz}{If \code{true}, the \code{tikz} LaTeX package is loaded.}
#'     \item{theorems}{If \code{true}, the \code{amsthm} LaTeX package is loaded,
#'                     and a number of default theorem environments are created:
#'                     theorem (theorem number prefaced by "Theorem"),
#'                     proposition (theorem number prefaced by "Proposition"),
#'                     lemma (theorem number prefaced by "Lemma"),
#'                     corollary (theorem number prefaced by "Corollary",
#'                                numbered with reference to the last
#'                                \code{proposition}; i.e., if after
#'                                "Proposition 1", the first \code{corollary}
#'                                will be "Corollary 1.1"),
#'                     and thm_corollary (theorem number prefaced by "Corollary",
#'                                        numbered with reference to the last
#'                                        \code{theorem}).}
#' }
#'
#' @param ... Arguments passed to \code{\link[rmarkdown]{pdf_document}}.
#'
#' @return An R Markdown output format.
#' @name formats
NULL

#' @export
#' @rdname formats
jop_submission <- function(...) {
    return(pdf_document_format("jop", ...))
}
