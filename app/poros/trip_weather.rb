class TripWeather
  attr_reader :data,
              :travel_data

  def initialize(weather_data, travel_data)
    @data = weather_data
    @travel_data = travel_data
  end

  def full_hours(data)
    data[:hourly].map do |data|
      { 
        time: Time.at(data[:dt]).strftime('%I:%M:%S %p'),
        temperature: data[:temp],
        conditions: data[:weather].first[:description],
        icon: data[:weather].first[:icon]
      }
    end
  end

  def route_possibilities
    # binding.pry
    if @travel_data.travel_time == nil
      "Impossible Route"
    else
      @travel_data.travel_time.to_i
    end
    
  end

  def weather_at_eta
    # binding.pry
    if route_possibilities == "Impossible Route"
      {
        "temperature": nil,
        "conditions": nil
      }
    elsif route_possibilities <= 48
      {
        "temperature": full_hours(data)[route_possibilities - 1][:temperature],
        "conditions": full_hours(data)[route_possibilities - 1][:conditions]
      }
    else
      # binding.pry
      { 
      "temperature": @data[:daily][(route_possibilities / 24) - 1][:temp][:max],
      "conditions": @data[:daily][(route_possibilities / 24) - 1][:weather].first[:description]
      }
    end 
  end
end