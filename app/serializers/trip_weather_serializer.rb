class TripWeatherSerializer
  def self.get_arrival_weather(eta)
    { 
      "data": {
        "id": "null",
        "type": "roadtrip",
        "attributes": {
          "start_city": eta.travel_data.origin.titleize,
          "end_city": eta.travel_data.destination.titleize,
          "travel_time": eta.route_possibilities,
          "weather_at_eta": eta.weather_at_eta
        }
      }
    }
  end
end