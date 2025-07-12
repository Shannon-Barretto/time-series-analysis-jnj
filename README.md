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

## 📁 Files

- `10927437_Time_Series_Coursework.pdf`: The full report detailing the analysis, methodology, diagnostics, and conclusion.

## 🛠 Tools & Techniques

- R programming language
- ARIMA modeling (`arima()` function)
- Time series diagnostic plots
- Shapiro-Wilk test for normality

## ✍️ Author

**Shannon Sabastian Barretto**  
University of Manchester  
April 2025

---

*This project was completed as part of a Time Series module and is meant for academic and educational purposes.*
