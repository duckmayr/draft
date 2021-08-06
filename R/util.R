## Text processing (extracting regex matches & counting words)
extract_matches <- function(pattern, text) {
    matches <- gregexpr(pattern = pattern, text = text, perl = TRUE)
    return(unlist(regmatches(x = text, m = matches)))
}
wc   <- function(x) length(unlist(gregexpr("[[:space:]]+", x))) + 1
