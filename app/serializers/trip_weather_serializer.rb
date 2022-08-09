class TripWeatherSerializer
  def self.get_arrival_weather(eta)
    binding.pry
    { 
      "data": {
        "id": null,
        "type": "roadtrip",
        "attributes": {
          "start_city": "",
          "end_city": "",
          "travel_time": eta.travel_time,
          "weather_at_eta": eta.weather_at_eta
        }
      }
    }
  end
end