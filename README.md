# Time Series Analysis: Johnson & Johnson Quarterly Earnings

This repository contains a time series analysis project that applies ARIMA modeling to Johnson & Johnson's quarterly earnings per share data from 1960 to 1980. The analysis was completed as part of a university coursework in April 2025. 

This project received a score of `92.5%`, with minor deductions related to model identification and diagnostic completeness.

## 📄 Coursework Summary

- **Dataset**: Johnson & Johnson quarterly earnings per share (EPS), 1960 Q1 – 1980 Q4 (21 years)
- **Goal**: Fit an appropriate ARIMA model to the time series data, evaluate residual diagnostics, and compare models.
- **Approach**:
  - Trend and seasonal analysis using differencing
  - Stationarity checks using ACF/PACF
  - Fitting ARIMA models with and without log transformation
  - Diagnostic checking using residual plots and Shapiro-Wilk test
  - Model selection based on AIC, log-likelihood, and parsimony

## 📊 Key Results

- Log transformation of the data improved model performance significantly.
- The chosen model was **ARIMA(0, 1, 1) × (0, 1, 0)<sub>4</sub>**, which had a good balance of interpretability and statistical validity.
- Residual diagnostics confirmed improvement in Gaussianity and independence.

## 🧠 Lessons Learned

- My initial ARIMA model identification (ARIMA(1,1,1) × (0,1,0)<sub>4</sub>) was slightly off. Based on the ACF decay and PACF cutoff at lag 1, the more appropriate model would have been ARIMA(1,1,0) × (0,1,0)<sub>4</sub>.
- I also missed Gaussianity tests for the residuals of the log-transformed models. This would have strengthened the model validation and supported the choice of the final model more rigorously.

These insights were noted in the feedback and helped me better understand model diagnostics and time series assumptions.

## 📁 Files

- `10927437_Time_Series_Coursework.pdf`: The full report detailing the analysis, methodology, diagnostics, and conclusion.
- `10927437.r`: R script used for plotting and modelling

## 🛠 Tools & Techniques

- R programming language
- ARIMA modeling (`arima()` function)
- Time series diagnostic plots
- Shapiro-Wilk test for normality

## ✍️ Author

**Shannon Sabastian Barretto**  
April 2025

---

*This project was completed as part of a Time Series module and is meant for academic and educational purposes.*
