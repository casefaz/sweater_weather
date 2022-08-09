class TripWeatherFacade
  def self.get_arrival_weather(lat, long, origin, destination)
    weather_data = WeatherService.get_weather(lat, long)
    road_time = RoadTripFacade.get_length(origin, destination)
    travel_time = road_time.travel_time

    TripWeather.new(weather_data, travel_time)
  end
end