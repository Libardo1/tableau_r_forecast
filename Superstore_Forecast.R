library(forecast)
# Date formatting is bad, convert to correct format
SuperstoreSales$Order.Date <- as.Date(as.character(SuperstoreSales$Order.Date), format="%m/%d/%y")
# Create time sereis
time <- ts(data=SuperstoreSales$Sales, start=c(2010, 1), deltat=1/12)
# Forecast
fcast <- forecast(time)

# Or, you can do an Arima Model
time <- ts(data=SuperstoreSales$Sales, start=c(2010, 1), deltat=1/12)
timeArima <- auto.arima(time)
fcastArima <- forecast.Arima(timeArima)

# Determine accuracy of fit
accuracy(fcast)
# Plot fitted model
plot(forecast(time))
lines(fitted(fcast),col="blue")
