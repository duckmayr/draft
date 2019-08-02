## I would just @importFrom rticles find_resource pdf_document_format,
## but they're not exported, so I lightly adapt them for my own purposes

get_template <- function(format) {
    return(system.file("rmarkdown", "templates", format, "resources",
                       "template.tex", package = "draft"))
}

pdf_document_format <- function(format, template = get_template(format), ...) {
    fmt <- rmarkdown::pdf_document(..., template = template)
    fmt$inherits <- "pdf_document"
    fmt
}
