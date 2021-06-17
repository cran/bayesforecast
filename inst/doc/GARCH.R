## ----setup, include=FALSE---------------------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE,comment = "#>")
knitr::opts_chunk$set(echo = TRUE)

knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  dev = "png",
  dpi = 150,
  fig.asp = 0.8,
  fig.width = 10,
  out.width = "60%",
  fig.align = "center")

## ----message=FALSE----------------------------------------------------------------------
library(bayesforecast)
library(ggplot2)

## ----demgbp-----------------------------------------------------------------------------
autoplot(demgbp,main ="DEM/GBP Foreign exchange",ylab ="log-returns",x = "Days" )

## ----echo=FALSE,results='hide'----------------------------------------------------------
set.seed(6551)
sf1 = stan_garch(ts = demgbp,order = c(1,1,0),genT = TRUE,chains = 1)

## ----eval=FALSE-------------------------------------------------------------------------
#  sf1 = stan_garch(ts = demgbp,order = c(1,1,0),genT = TRUE,chains = 1)
#  summary(sf1)

## ----echo=FALSE-------------------------------------------------------------------------
summary(sf1)

## ---------------------------------------------------------------------------------------
prior_summary(sf1)

## ---------------------------------------------------------------------------------------
mcmc_plot(sf1)

## ----residuals_demgbp-------------------------------------------------------------------
check_residuals(sf1)

## ----forecast_demgbp--------------------------------------------------------------------
autoplot(object = forecast(sf1,h = 12),ylab="log-returns")

