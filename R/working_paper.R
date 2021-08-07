#' Working Paper Format
#'
#' This format is a basic format for general purpose use in drafting working
#' papers, perhaps before you have a journal you're going to send it to. It is
#' based very closely on the default R Mardown PDF document format, with some
#' defaults changed to comport with many common choices for working papers in
#' political science:
#'
#' \itemize{
#'     \item One inch margins with double spacing and 12 point font
#'     \item A title page with the abstract and word count
#'     \item Using biblatex for reference management
#'     \item Appendices after the references, with figure and table numbering
#'         by appendix, in the style A.1, B.1, B.2, etc., and roman page
#'         numbering for appendix pages (starting with i). To take advantage
#'         of this automatic formatting of the appendices, they must be placed
#'         in one or more separate R Markdown files whose names are given in
#'         the YAML front matter option \code{appendices}, as in
#'
#'         \code{appendices: "appendix.Rmd"}
#'
#'         for a single file, whether that be a single appendix or multiple
#'         appendices in a single file, or
#'
#'         \code{appendices: ["data-appendix.Rmd", "methods-appendix.Rmd"]}
#'
#'         for multiple file The important thing is that each file name must
#'         be in quotation marks (either single (') or double (") quotes are
#'         fine). Additionally, you must use the YAML front matter option
#'         \code{knit: draft::knit_with_appendices} (which is included by
#'         default in the \code{working_paper} format skeleton).
#' }
#'
#' You can use the \code{\link{word_count}} function to obtain a word count for
#' the document, which you can then place in the \code{wordcount} YAML front
#' matter option for it to be displayed on the title page.
#'
#' Appendices should be drafted
#'
#' @param ... Arguments passed to \code{\link[bookdown]{pdf_document2}}
#'
#' @importFrom bookdown pdf_document2
#' @export
working_paper <- function(...) {
    bookdown::pdf_document2(
        template = get_template("working_paper"),
        citation_package = "biblatex",
        ...
    )
}
