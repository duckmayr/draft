#' R Markdown Output Formats
#' 
#' @param ... Arguments passed to \code{\link[rmarkdown]{pdf_document}}.
#' 
#' @return An R Markdown output format.
#' @export
#' @rdname formats
jop_submission <- function(...) {
    return(pdf_document_format("jop", ...))
}
