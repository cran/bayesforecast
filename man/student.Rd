% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/prior.R
\name{student}
\alias{student}
\title{Define a t student prior distribution}
\usage{
student(mu = 0, sd = 1, df = 5)
}
\arguments{
\item{mu}{the location parameter mu}

\item{sd}{the standard deviation parameter sigma}

\item{df}{the degree freedom parameter df}
}
\value{
a numerical vector interpreted as a prior in Stan
}
\description{
student(mu,sd)
}
\details{
Define a t student prior distribution using the hyper parameters
mu, sigma and df as degree freedom, by default a standard t-student(0,1,5)
distribution with 5 degree freedom is return.
}
