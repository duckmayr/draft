## This function extracts regex matches from a string
## (somewhat similar to stringr::str_extract_all, but using only base)
extract_matches <- function(pattern, text) {
    matches <- gregexpr(pattern = pattern, text = text, perl = TRUE)
    return(unlist(regmatches(x = text, m = matches)))
}

## This function counts the number of words in a string
wc <- function(x) length(unlist(gregexpr("[[:space:]]+", x))) + 1

## This function finds the path to the TeX template for a particular format
get_template <- function(format) {
    return(system.file(
        "rmarkdown", "templates", format, "resources", "template.tex",
        package = "draft"
    ))
}
