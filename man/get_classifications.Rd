% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_classifications.R
\name{get_classifications}
\alias{get_classifications}
\title{Get a tidy data frame of classifications of all functions used in your analysis}
\usage{
get_classifications(lexicon = NULL, include_duplicates = TRUE)
}
\arguments{
\item{lexicon}{Character. The classification lexicon to retrieve. Either
"crowdsource" or "leeklab". If \code{NULL} (default), will return all lexicons.}

\item{include_duplicates}{Logical. Indicates whether to include all functions
and classifications along with their score (default, \code{TRUE}) - this may
result in multiple lines (with multiple classifications) for a single function.
If \code{FALSE}, the most prevalent classification will be selected.}
}
\value{
A \code{tbl_df} with columns:
\itemize{
\item \code{func}: the function
\item \code{classification}: the classification
}

If \code{include_duplicates = TRUE}, will include a column:
\itemize{
\item \code{score}: the score
}

If \code{lexicon} is \code{NULL}, will include a column:
\itemize{
\item \code{lexicon}: the classification lexicon
}
}
\description{
Get a tidy data frame of classifications of all functions used in your analysis
}
\examples{
# Get a data frame of all classifications
get_classifications()

# Get a data frame of the most prevalent classifications
get_classifications(include_duplicates = FALSE)

# Get a data frame of only `leeklab` classifications
get_classifications("leeklab")

}
