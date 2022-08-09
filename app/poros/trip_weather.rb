class TripWeather
  attr_reader :data,
              :travel_data

  def initialize(weather_data, travel_data)
    # binding.pry
    @data = weather_data
    @travel_data = travel_data
  end

  def full_hours(data)
    # binding.pry
    data[:hourly].map do |data|
      { 
        time: Time.at(data[:dt]).strftime('%I:%M:%S %p'),
        temperature: data[:temp],
        conditions: data[:weather].first[:description],
        icon: data[:weather].first[:icon]
      }
    end
  end

  def weather_at_eta
    travel_time = @travel_data.travel_time.to_i
    if travel_time <= 48
      {
        "temperature": full_hours(data)[travel_time - 1][:temperature],
        "conditions": full_hours(data)[travel_time - 1][:conditions]
      }
    else
      { 
      "temperature": @data[:daily][(travel_time / 24) - 1][:max_temp],
      "conditions": @data[:daily][(travel_time / 24) -1][:conditions]
      }
    end 
  end
end