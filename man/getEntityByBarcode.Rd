% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/getEntityByBarcode.R
\name{getEntityByBarcode}
\alias{getEntityByBarcode}
\title{getEntityByBarcode - Get an entity from the LIMS by barcode.}
\usage{
getEntityByBarcode(coreApi, entityType, barcode, useVerbose = FALSE)
}
\arguments{
\item{coreApi}{coreApi object with valid jsessionid}

\item{entityType}{entity type to get}

\item{barcode}{barcode of entity to get}

\item{useVerbose}{TRUE or FALSE to indicate if verbose options should be used in http POST}
}
\value{
returns a list $entity contains entity information, $response contains the entire http response
}
\description{
\code{getEntityByBarcode} Get an entity from the LIMS by barcode and entityType.
}
\details{
\code{getEntityByBarcode} get an entity from the LIMS by barcode
}
\examples{
\dontrun{
api<-CoreAPI("PATH TO JSON FILE")
login<- CoreAPI::authBasic(api)
item<-getEntityByBarcode(login$coreApi,"entityType","barcode")
logOut(login$coreApi)
}
}
\author{
Craig Parman
}
