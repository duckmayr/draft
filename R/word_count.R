#' Produce a word count for an R Markdown document
#'
#' When producing a PDF document via LaTeX (via R Markdown), word count options
#' are often unsatisfactory. Using command line tools such as pdftototex +
#' wc can notoriously overcount; for example, it would include page numbers as
#' well as sometimes axis labels (and axis tick labels) in word counts. Many
#' publishers also consider tools like texcount to notoriously undercount.
#' This function attempts to get an accurate word count for an R Markdown
#' document that will be rendered to PDF via LaTeX. As with any option, it will
#' be imperfect, but it tends to provide counts between using texcount or the
#' pdftotext + wc options, so it should be fairly accurate.
#'
#' @param path A character vector of lenth one; the path to the file for which
#'   a word count is desired
#'
#' @return A named numeric vector of class "wordcount". The vector separately
#'   lists wordc ounts for: (1) text, including section headings and footnotes;
#'   (2) captions and subcaptions; (3) citations in the text; (4) the
#'   references section; and (5) the total word count of all of the above.
#'
#' @export
word_count <- function(path) {
    ## Read in text from path
    text <- paste(readLines(path), collapse = "\n")
    ## Find and parse bib file
    bib  <- extract_matches(pattern = "(?<=bibliography:)[^\n]+", text = text)
    bib  <- trimws(gsub("['\"]", "", bib))
    bib  <- RefManageR::ReadBib(file.path(dirname(path), bib))
    ## Remove frontmatter
    text <- gsub(pattern = "---\n.+\n---\n", replacement = "", x = text)
    ## Get figure captions from chunk options
    pat  <- "(?<=fig.cap) *= *'([^']+)'|(?<=fig.cap) *= *\"([^\"]+)\""
    caps <- extract_matches(pattern = pat, text = text)
    pat  <- "(?<=fig.subcap) *= *c\\(([^)]+)"
    subs <- extract_matches(pattern = pat, text = text)
    pat  <- "'([^']+)'|\"([^)]+)\""
    subs <- extract_matches(pattern = pat, text = subs)
    ## TODO: Get table captions from R code
    ## Get any captions that remain from raw LaTeX code
    pat  <- "(?<=\\\\caption\\{)[^}]+"
    caps <- c(caps, extract_matches(pattern = pat, text = text))
    pat  <- "(?<=\\\\subcaption\\{)[^}]+"
    subs <- c(subs, extract_matches(pattern = pat, text = text))
    ## Remove code blocks
    text <- gsub(pattern = "```\\{.+?```", replacement = "", x = text)
    ## Get then remove citations
    pat  <- "@[^ .;,\n\\]]+" ## This picks up on all refs, even crossrefs
    keys <- extract_matches(pattern = pat, text = text) ## Find them
    keys <- gsub("@", "", keys[!grepl("ref\\(", keys)]) ## Remove crossrefs & @s
    cits <- utils::capture.output(RefManageR::Cite(bib, keys)) ## Get cites text
    refs <- utils::capture.output(print(bib[unique(keys)]))    ## Get refs text
    text <- gsub(pattern = pat, replacement = "", x = text) ## X refs from text
    ## Remove escaped dollar signs
    text <- gsub("\\\\$", "", text)
    ## Remove math environment delimiters
    pat  <- "\\begin\\{equation\\**\\}|\\end\\{equation\\**\\}"
    text <- gsub(pattern = pat, replacement = "", x = text)
    pat  <- "\\begin\\{align\\**\\}|\\end\\{align\\**\\}"
    text <- gsub(pattern = pat, replacement = "", x = text)
    pat  <- "\\${1,2}|\\\\(|\\\\)|\\\\[|\\\\]"
    text <- gsub(pattern = pat, replacement = "", x = text)
    ## Count words in each group
    text <- wc(text)
    caps <- wc(caps)
    subs <- wc(subs)
    cits <- wc(cits)
    refs <- wc(refs)
    subt <- c(
        "text + section headings + footnotes" = text,
        "captions + subcaptions" = caps + subs,
        "citations" = cits,
        "references" = refs
    )
    res <- c(subt, "total" = sum(subt))
    class(res) <- "wordcount"
    return(res)
}
