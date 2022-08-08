class MunchiesSerializer

  def self.locate_restaurants(city, restaurants, forecast)
    binding.pry
    { 
      "data": {
        "id": "null",
        "type": "munchie",
        "attributes": {
          "destination_city": city,
          "forecast": {
            "summary": forecast.current_weather[:conditions],
            "temperature": forecast.current_weather[:temperature]
          },
          "restaurant": {
            
          }
        }
      }
    }
  end
end