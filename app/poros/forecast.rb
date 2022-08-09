class Forecast
  attr_reader :current_weather,
              :hourly_weather,
              :daily_weather,
              :id
              :data
  def initialize(data)
    @id = nil
    @current_weather = current(data[:current])
    @hourly_weather = hourly(data[:hourly])
    @daily_weather = daily(data[:daily])
    @data = data
  end

  def current(data)
    {
      datetime: Time.at(data[:dt]).to_s,
      sunrise: Time.at(data[:sunrise]).to_s,
      sunset: Time.at(data[:sunset]).to_s,
      temperature: data[:temp],
      feels_like: data[:feels_like],
      humidity: data[:humidity],
      uvi: data[:uvi],
      visibility: data[:visibility],
      conditions: data[:weather].first[:description],
      icon: data[:weather].first[:icon]
    }
  end

  def hourly(data)
    data.first(8).map do |data|
      { 
        time: Time.at(data[:dt]).strftime('%I:%M:%S %p'),
        temperature: data[:temp],
        conditions: data[:weather].first[:description],
        icon: data[:weather].first[:icon]
      }
    end
  end

  def daily(data)
    data[1..5].map do |data|
      {
        date: Time.at(data[:dt]).to_s,
        sunrise: Time.at(data[:sunrise]).to_s,
        sunset: Time.at(data[:sunset]).to_s,
        max_temp: data[:temp][:max],
        min_temp: data[:temp][:min],
        conditions: data[:weather].first[:description],
        icon: data[:weather].first[:icon]
      }
    end
  end

  def weather_at_eta(travel_time)
    # binding.pry
    length = travel_time.to_i
    if length <= 8
      { 
        @hourly_weather[length - 1][:temperature],
        @hourly_weather[length - 1][:conditions]
      }
    elsif length >= 9 && length <= 24
      { 
        @current_weather[:temperature],
        @current_weather[:conditions]
      }
    else 
      { @daily_weather[(length / 24) - 1][:max_temp],
        @daily_weather[(length / 24) -1][:conditions]
      }
    end 
  end
end