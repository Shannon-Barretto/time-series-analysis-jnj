tsdiags <- function(fit, lag=20) {
#use this instead of 'tsdiag' which gets P-values wrong
#JY 21/04/2021 
#updated 24/06/2022 to plot standardised residuals  

    fitdf <- length(fit$coef)    #number of parameters 	
    if (lag <= fitdf) lag <- fitdf + 20

    resid_acf <- acf(fit$resid, lag, plot=F)
    resid_acf$acf[1] <- 0        #get rid of 1 at lag 0

    p_values <- rep(NA, fitdf) 
    for (k in (fitdf+1):lag) {
		p <- Box.test(fit$resid, k, "Ljung-Box", fitdf)$p.value
		if (p<0.05) cat("for test up to lag", k, ", p-value = ", round(p, 4), "\n") 
		p_values <- c(p_values, p)
    }
    
    par(mfrow=c(3,1))
    fit_name <- lapply(sys.call()[2], "as.character")
#   plot(fit$resid, type="l", main=paste("residuals from", fit_name))
    plot(fit$resid/sqrt(fit$sigma2), type="l", main=paste("standardised residuals from", fit_name), ylab="std resid")
    plot(resid_acf, main="residual acf")
    plot(c(1, lag), c(0, 1), type="n", xlab="lag", ylab="p_value", 
                    main="P-values for Ljung-Box tests")
    points(1:lag, p_values)
    abline(h=0.05, lty=2)
}
