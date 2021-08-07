#' Convert R Markdown appendices to LaTeX before Knitting Main Document
#'
#' @param input The path to the main R Markdown file
#' @param ... (Unused)
#'
#' @importFrom knitr knit
#' @importFrom rmarkdown render
#' @importFrom rmarkdown pandoc_convert
#' @export
knit_with_appendices <- function(input, ...) {
    text <- readLines(input)
    idx  <- which(grepl("^appendices:", text))
    if ( length(idx) ) {
        opts <- c(
            "--biblatex",
            "--from", "markdown+autolink_bare_uris+tex_math_single_backslash"
        )
        appendicesRmd <- extract_matches("(?<=\"|')[^'\"]+(?=\"|')", text[idx])
        appendices_md <- gsub("Rmd", "md",  appendicesRmd)
        appendicesTeX <- gsub("Rmd", "tex", appendicesRmd)
        knitr::opts_knit$set(out.format = "latex")
        knitr::opts_knit$set(rmarkdown.pandoc.to = "latex")
        for ( i in seq_along(appendicesRmd) ) {
            knitr::knit(
                input = appendicesRmd[i],
                output = appendices_md[i],
                envir = globalenv()
            )
            rmarkdown::pandoc_convert(
                appendices_md[i],
                to = "latex",
                output = appendicesTeX[i],
                options = opts
            )
        }
    }
    opts <- list(includes = list(after_body = appendicesTeX))
    rmarkdown::render(input, output_options = opts)
}
