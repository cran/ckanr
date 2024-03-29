% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ckanr_settings.R
\name{ckanr_setup}
\alias{ckanr_setup}
\title{Configure default CKAN settings}
\usage{
ckanr_setup(
  url = "https://data.ontario.ca/",
  key = NULL,
  test_url = NULL,
  test_key = NULL,
  test_did = NULL,
  test_rid = NULL,
  test_gid = NULL,
  test_oid = NULL,
  test_behaviour = NULL,
  proxy = NULL
)
}
\arguments{
\item{url}{A CKAN URL (optional), default: https://data.ontario.ca}

\item{key}{A CKAN API key (optional, character)}

\item{test_url}{(optional, character) A valid CKAN URL for testing purposes}

\item{test_key}{(optional, character) A valid CKAN API key privileged to
create datasets at \code{test_url}}

\item{test_did}{(optional, character) A valid CKAN dataset ID, existing at
\code{test_url}}

\item{test_rid}{(optional, character) A valid CKAN resource ID, attached to
\code{did}}

\item{test_gid}{(optional, character) A valid CKAN group name at \code{test_url}}

\item{test_oid}{(optional, character) A valid CKAN organization name at
\code{test_url}}

\item{test_behaviour}{(optional, character) Whether to fail ("FAIL") or skip
("SKIP") writing tests in case of problems with the configured test CKAN.}

\item{proxy}{an object of class \code{request} from a call to
\code{\link[crul:proxies]{crul::proxy()}}}
}
\description{
Configure default CKAN settings
}
\details{
\code{\link[=ckanr_setup]{ckanr_setup()}} sets CKAN connection details. ckanr's functions
default to use the default URL and API key unless specified explicitly.

ckanr's automated tests require a valid CKAN URL, a privileged API key
for that URL, plus the IDs of an existing dataset and an existing resource,
respectively.

The writing tests (create, update, delete) can fail for two reasons:
failures in ckanr's code which the tests aim to detect,
or failures in the configured CKAN, which are not necessarily a problem
with ckanr's code but prevent the tests to prove otherwise.

Setting \code{test_behaviour} to \code{"SKIP"} will allow writing tests to skip
if the configured test CKAN fails. This is desirable to e.g. test the other
functions even if the tester has no write access to a CKAN instance.

Setting \code{test_behaviour} to \code{"FAIL"} will let the tester find any
problems with both the configured test CKAN and the writing functions.
}
\examples{
# CKAN users without admin/editor privileges could run:
ckanr_setup(url = "https://data.ontario.ca/")

# Privileged CKAN editor/admin users can run:
ckanr_setup(url = "https://data.ontario.ca/", key = "some-CKAN-API-key")

# ckanR developers/testers can run:
ckanr_setup(url = "https://data.ontario.ca/", key = "some-CKAN-API-key",
           test_url = "http://test-ckan.gov/",test_key = "test-ckan-API-key",
           test_did = "test-ckan-dataset-id",test_rid = "test-ckan-resource-id",
           test_gid = "test-group-name", test_oid = "test-organzation-name",
           test_behaviour = "FAIL")

# Not specifying the default CKAN URL will reset the CKAN URL to its default
# "https://data.ontario.ca/":
ckanr_setup()

# set a proxy
ckanr_setup(proxy = crul::proxy("64.251.21.73:8080"))
ckanr_settings()
## run without setting proxy to reset to no proxy
ckanr_setup()
ckanr_settings()
}
