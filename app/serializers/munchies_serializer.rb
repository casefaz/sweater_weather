class MunchiesSerializer

  def self.locate_restaurants(city, restaurants, forecast)
    # binding.pry
    { 
      "data": {
        "id": nil,
        "type": "munchie",
        "attributes": {
          "destination_city": city.titleize,
          "forecast": {
            "summary": forecast.current_weather[:conditions],
            "temperature": forecast.current_weather[:temperature]
          },
          "restaurant":
            {
              "name": restaurants.first.name,
              "address": restaurants.first.address
          }
        }
      }
    }
  end
end