## ----SETTINGS-knitr, include = FALSE----------------------------------------------------
stopifnot(require(knitr))

options(width = 90)
knitr::opts_chunk$set(collapse = TRUE,comment = "#>")
knitr::opts_chunk$set(echo = TRUE,
                      message = FALSE,
                      warning = FALSE,
                      dev = "png",
                      dpi = 150,
                      fig.asp = 0.8,
                      fig.width = 5,
                      out.width = "60%",
                      fig.align = "center")

library(bayesforecast)
library(ggplot2)

## ----ipc--------------------------------------------------------------------------------
autoplot(object = ipc,main = "Inflation rate in Honduras",ylab="CPI")

## ---------------------------------------------------------------------------------------
g1 = autoplot(object = diff(ipc),main = "Differentiated series on inflation in Honduras",y = "CPI")
g2 = ggacf(y = diff(ipc))
g3 = ggpacf(y = diff(ipc))


gridExtra::grid.arrange(g1,g2,g3,
                        layout_matrix = matrix(c(1,2,1,3),nrow = 2))

## ----echo=FALSE,results='hide'----------------------------------------------------------
set.seed(6551)
sf1 = stan_sarima(ts = ipc,order = c(1,1,1),seasonal = c(1,1,1),
                  prior_sar = beta(2,2),prior_sma = beta(2,2),chains = 1)

## ----eval=FALSE-------------------------------------------------------------------------
#  sf1 = stan_sarima(ts = ipc,order = c(1,1,1),seasonal = c(1,1,1),
#                    prior_sar = beta(2,2),prior_sma = beta(2,2),chains = 1)
#  
#  summary(sf1)

## ----echo=FALSE-------------------------------------------------------------------------
summary(sf1)

## ----fig.height = 15--------------------------------------------------------------------
mcmc_plot(object = sf1)

## ----posterior_predict------------------------------------------------------------------
autoplot(sf1)+labs(title = "Posterior Predict", y="CPI")

## ----residuals_ipc----------------------------------------------------------------------
check_residuals(sf1)

## ----forecast_ipc-----------------------------------------------------------------------
autoplot(object = forecast(sf1,h = 12),ylab="CPI")

