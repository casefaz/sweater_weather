class TripWeatherSerializer
  def self.get_arrival_weather(eta)
    { 
      "data": {
        "id": "null",
        "type": "roadtrip",
        "attributes": {
          "start_city": eta.travel_data.origin.titleize,
          "end_city": eta.travel_data.destination.titleize,
          "travel_time": eta.travel_data.travel_time,
          "weather_at_eta": if eta.weather_at_eta.nil?
                              { }
                            else 
                              eta.weather_at_eta
                            end
        }
      }
    }
  end
end