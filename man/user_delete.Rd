% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/user_delete.R
\name{user_delete}
\alias{user_delete}
\title{Delete a user.}
\usage{
user_delete(
  id,
  url = get_default_url(),
  key = get_default_key(),
  as = "list",
  ...
)
}
\arguments{
\item{id}{(character) the id of the new user (required)}

\item{url}{Base url to use. Default: https://data.ontario.ca/ See
also \code{\link{ckanr_setup}} and \code{\link{get_default_url}}.}

\item{key}{A privileged CKAN API key, Default: your key set with
\code{\link{ckanr_setup}}}

\item{as}{(character) One of list (default), table, or json. Parsing with
table option uses \code{jsonlite::fromJSON(..., simplifyDataFrame = TRUE)},
which attempts to parse data to data.frame's when possible, so the result
can vary from a vector, list or data.frame. (required)}

\item{...}{Curl args passed on to \code{\link[crul]{verb-POST}} (optional)}
}
\description{
Delete a user.
}
\examples{
\dontrun{
# Setup
ckanr_setup(url = "https://data-demo.dpaw.wa.gov.au",
key = "824e7c50-9577-4bfa-bf32-246ebed1a8a2")

# create a user
res <- user_delete(name = 'stacy', email = "stacy@aaaaa.com",
password = "helloworld")

# then, delete a user
user_delete(id = "stacy")
}
}
\references{
http://docs.ckan.org/en/latest/api/index.html#ckan.logic.action.delete.user_delete
}
