# devdbe-weather-sdk

A small SDK to get weather forecasts from Weatherbit.io.
Created for testing purposes to get familiar with Swift Packages.

# API Overview
## Daily forecast

```swift
func dailyForecast(city: String, countryCode: String, days: Int) async -> RForecastDay?
```

Given a `city` and a `countryCode`, fetch the daily forecasts for the given number of `days`.

# API Key
When initializing the `WeatherApiImpl`, an API key must be provided. Otherwise you will not have the permissions to fetch the forecasts.
