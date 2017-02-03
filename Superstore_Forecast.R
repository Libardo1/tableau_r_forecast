library(forecast)
# Date formatting is bad, convert to correct format
SuperstoreSales$Order.Date <- as.Date(as.character(SuperstoreSales$Order.Date), format="%m/%d/%y")
# Create time sereis
time <- ts(data=SuperstoreSales$Sales, start=c(2010, 1), deltat=1/12)

# Arima Model
#time <- Arima(window(time),order=c(0,1,1),
#                   seasonal=list(order=c(0,1,1),period=12),lambda=0)# Fit into forecsast model
#fcast <- forecast.Arima(time)

fcast <- forecast(time)
# Determine accuracy of fit
accuracy(fcast)
# Plot fitted model
plot(forecast(time))
lines(fitted(fcast),col="blue")

SuperstoreSales <- read.csv("SuperstoreSales.csv")

z=WWWusage