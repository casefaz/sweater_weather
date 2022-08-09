class TripWeatherFacade
  def self.get_arrival_weather(lat, long, origin, destination)
    weather_data = WeatherService.get_weather(lat, long)
    road_time = RoadTripFacade.get_length(origin, destination)

    TripWeather.new(weather_data, road_time)
  end
end