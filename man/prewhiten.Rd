% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/func_whiten.R
\name{prewhiten}
\alias{prewhiten}
\alias{prewhiten.default}
\alias{prewhiten.ts}
\title{Prepare a series for spectral estimation}
\usage{
prewhiten(tser, ...)

\method{prewhiten}{default}(tser, x.fsamp = 1, x.start = c(1, 1), ...)

\method{prewhiten}{ts}(tser, AR.max = 0L, detrend = TRUE, demean = TRUE,
  impute = TRUE, plot = TRUE, verbose = TRUE, ...)
}
\arguments{
\item{tser}{vector; An object to prewhiten.}

\item{...}{variables passed to \code{prewhiten.ts} (for non \code{ts} objects)}

\item{x.fsamp}{sampling frequency (for non \code{ts} objects)}

\item{x.start}{start time of observations (for non \code{ts} objects)}

\item{AR.max}{numeric; the maximum AR order to fit.}

\item{detrend}{logical; Should a trend (and mean) be removed?}

\item{demean}{logical; Should a mean value be removed?}

\item{impute}{logical; Should NA values be imputed?}

\item{plot}{logical; Should the results be plotted?}

\item{verbose}{logical; Should messages be printed?}
}
\value{
A list with the model fits (\code{lm} and \code{ar} objects),
the linear and AR prewhitened series (\code{ts} objects), and a logical
flag indicating whether the I/O has been imputed. This list includes:
\code{"lmdfit"}, \code{"ardfit"}, \code{"prew_lm"}, \code{"prew_ar"}, and \code{"imputed"}

\emph{Note that if \code{AR.max=0} the AR information will exist as \code{NULL}.}
}
\description{
Remove (optionally) mean, trend, and Auto Regressive (AR) model
from the original series.
}
\details{
The R-S multitapers do not exhibit the remarkable spectral-leakage 
suppression properties of the Thomson prolate tapers, 
so that in spectra with large dynamic range, 
power bleeds from the strong peaks into neighboring frequency bands of 
low amplitude -- spectral leakage. 
Prewhitening can ameliorate the problem, at least for red spectra 
[see Chapter 9, Percival and Walden (1993)]. 

The value of the \code{AR.max} argument is made absolute, after which
this function has essentially two modes of operation (detailed below):
\describe{
\item{\code{AR.max} == 0}{Remove (optionally) a mean and/or linear trend.}
\item{\code{AR.max} > 0}{Remove an autoregressive model}
}
In the second case,
the time series is 
filtered in the time domain with a finite-impluse-response 
filter of \code{AR.max} terms. The filter is found by solving the Yule-Walker 
equations for 
which it is assumed the series was generated by an autoregressive process, up to
order \code{AR.max}.
\subsection{Mean and trend (\code{AR.max == 0})}{

Power spectral density estimates can become badly biased
(especially at lower frequencies) if a signal of the form
\eqn{f(x) = A x + B} is not removed from the series.  
If \code{detrend=TRUE} a model of this form is removed over the entire series using a
linear least-squares estimator; in this case a mean value is removed
regardless of the logical state of \code{demean}.
To remove \emph{only} a mean value, set \code{detrend=FALSE} and (obviously) \code{demean=TRUE}.

}

\subsection{Auto Regressive (AR) innovations (\code{AR.max > 0})}{

When an autoregressive model is removed from a non-stationary series, the residuals
are known as 'innovations', and may be stationary (or very-nearly stationary).  
This function fits an AR model [order at least 1, but up to and including AR(\code{AR.max})] to the series 
by solving the Yule-Walker equations; however, AIC is used to estimate the highest significant
order, which means that higher-order components may not necessarily be fit.
The resulting innovations can be used to better estimate the stationary component
of the original signal, and possibly in an interactive editing method.

Note that the method used here--solving the Yule-Walker equations--is 
not a true maximum likelihood estimator; hence the AIC is calculated
based on the variance estimate (no determinant). From \code{?ar}:
\emph{In \code{ar.yw} the variance matrix of the innovations is 
computed from the fitted coefficients and the autocovariance of \code{x}.}

A quick way to determine whether this may be needed for the series is to run
\code{acf} on the series, and see if significant non-zero lag correlations
are found.  A warning is produced if the fit returns an AR(0) fit, indicating
that AR prewhitening most likely inappropriate for the series, which
is apparently stationary (or very nearly so).  (The innovations could end up
having \emph{higher} variance than the input series in such a case.)

\emph{Note that \code{AR.max} is restricted to the range \eqn{[1,N-1]} where
\eqn{N} is the series length.}

}
}
\section{NA values}{


\code{NA} values are allowed.  If present, and \code{impute=TRUE}, 
the \code{na.locf} function in the package
\code{zoo} is used twice (with and without \code{fromLast} so that lead and
trailing \code{NA} values are also imputed).  The function name is an
acronym for "Last Observation Carried Forward", a very crude method
of imputation.
}

\examples{
\dontrun{#REX
library(psd)

##
## Using prewhiten to improve spectral estimates
##

data(magnet)
mts <- ts(magnet$clean)
# add a slope
mts.slope <- mts + seq_along(mts)

# Prewhiten by removing mean+trend, and
# AR model; fit truncates the series by 
# a few terms, so zero pad
mts <- prewhiten(mts.slope,  AR.max=10, zero.pad="rear")
mts.p <- mts[['prew_lm']]
mts.par <- mts[['prew_ar']]

# uniformly-tapered spectral estimates
PSD <- psdcore(mts.p, ntaper=20)
PSD.ar <- psdcore(mts.par, ntaper=20)

# remove the effect of AR model
PSD.ar[['spec']] <- PSD.ar[['spec']] / mean(PSD.ar[['spec']])
PSD[['spec']] <- PSD[['spec']] / PSD.ar[['spec']]

plot(PSD, log='dB', lwd=2, ylim=c(-5,35))
plot(PSD, log='dB', add=TRUE, lwd=2, col="red")
plot(PSD.ar, log='dB', add=TRUE, col="blue", lwd=2)

}#REX
}
\seealso{
\code{\link{psdcore}}, \code{\link{pspectrum}}
}
\author{
A.J. Barbour and Robert L. Parker
}
