The [`rticles`](https://github.com/rstudio/rticles) package provides a great
suite of LaTeX journal article templates for R Markdown. However, some journals
do not have LaTeX templates, and yet require particular formatting for
submission, such as double-spaced footnotes. (Some examples are the
[Journal of Politics][1] and the [American Journal of Political Science][2]).

[1]: https://www.journals.uchicago.edu/journals/jop/instruct
[2]: https://ajps.org/guidelines-for-manuscripts/manuscript-preparation/

`draft` aims to provide R Markdown templates for a range of political science
journals. Currently, the following templates are available:

  - `working_paper`: A general purpose template for working papers

The following templates are already planned to be included:

  - `apsr_article`: A template meeting the formatting quidelines for submission
    to the [American Political Science Review][3].
  - `ajps_article`: A template meeting the formatting guidelines for submission
    to the [American Journal of Political Science][2].
  - `jop_article`: A template meeting the formatting guidelines for submission
    to the [Journal of Politics][1].
  - `jlc_article`: A template meeting the formatting guidelines for submission
    to the [Journal of Law and Courts][4].

[3]: https://www.cambridge.org/core/journals/american-political-science-review/information/instructions-contributors
[4]: https://www.journals.uchicago.edu/journals/jlc/instruct

## Installation

`draft` is not currently on CRAN. The development version can be installed via
the R command

```r
devtools::install_github("duckmayr/draft")
```

## Contributing

If there is a political science journal that you'd like to see supported that
is not listed above, please file an issue with your feature request. If you're
willing to contribute to the package by adding a template, please first consult
the contributing guidelines in CONTRIBUTING.md.

