class ForecastFacade
  def self.forecast(lat, lon)
    weather = WeatherService.get_weather(lat, lon)
    Forecast.new(weather)
  end
end