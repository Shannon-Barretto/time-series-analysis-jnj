# Read the data
x <- scan("jnj.txt")

# Convert the data to a time series with frequency=4,
# to reflect the quarterly series earnings
x <- ts(x, start = c(1960, 1), frequency = 4)

# Plot the time series
plot(x, ylab = "Earnings per Share", xlab = "Year")

xdiff1 <- diff(x) # First-order differencing (1-B)x
plot(xdiff1, main = "First Order Differenced Series: (1-B)x",
     ylab = "xdiff1", xlab = "Year")
acf(xdiff1, main = "ACF of First Differenced Series: (1-B)x") # ACF

xdiff2 <- diff(diff(x, lag = 4))   # Seasonally: (1-B)(1-B^4)x
plot(xdiff2, ylab = "xdiff2", xlab = "Year")
acf(xdiff2, main = "ACF of second differenced series")      # ACF
pacf(xdiff2, main = "PACF of second differenced series")    # PACF

# Fit the ARIMA(1, 1, 1)(0, 1, 0)[4] model
model <- arima(xdiff2, order = c(1, 1, 1),
               seasonal = list(order = c(0, 1, 0), period = 4))
model   # Call the model to get the parameter estimates

source("tsdiags.r")
# To examine the residuals of the fitted model,
# and to check correlation and Gaussianity of the residuals
tsdiags(model)

par(mfrow = c(1, 1))

residuals <- resid(model)   # Extract the residuals from the fitted model
hist(residuals, main = "Histogram of Residuals")            # Histogram
qqnorm(residuals, main = "Normal Q-Q Plot of Residuals")    # Q-Q plot
qqline(residuals, col = "red")                            # Q-Q line
shapiro.test(residuals)                   # Shapiro-Wilk normality test

# Fitting the same model to the log quarterly earnings
logmodel <- arima(log(x), order = c(1, 1, 1),
                  seasonal = list(order = c(0, 1, 0), period = 4))
logmodel    # Call the model to get the parameter estimates

# Fitting a parsimonious model: ARIMA(0, 1, 1)(0, 1, 0)[4]
logmodel1 <- arima(log(x), order = c(0, 1, 1),
                   seasonal = list(order = c(0, 1, 0), period = 4))
logmodel1   # Call the model to get the parameter estimates

par(mfrow = c(1, 1))

# Plot the log quarterly earnings per share
plot(log(x), ylab = "Log Earnings per Share", xlab = "Year")
acf(log(x), main = "ACF of Log Earnings per Share") # ACF

logxdiff1 <- diff(log(x)) # First-order differencing (1-B)log(x)
plot(logxdiff1, main = "First Order Differenced Series: (1-B)log(x)",
     ylab = "logxdiff1", xlab = "Year")
acf(logxdiff1, main = "ACF of First Differenced Series: (1-B)log(x)") # ACF

logxdiff2 <- diff(diff(log(x), lag = 4))   # Seasonally: (1-B)(1-B^4)log(x)
plot(logxdiff2, ylab = "logxdiff2", xlab = "Year")
acf(logxdiff2, main = "ACF of second differenced series")   # ACF
pacf(logxdiff2, main = "PACF of second differenced series") # PACF

# Residual disgnostic for logmodel1 and logmodel
tsdiags(logmodel1)
tsdiags(logmodel)
