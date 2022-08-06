class Forecast
  attr_reader :current_weather,
              :hourly_weather,
              :daily_weather
  def initialize(data)
    @current_weather = current(data[:current])
    @hourly_weather = hourly(data[:hourly])
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
        time: Time.at(data[:dt]).to_s,
        temperature: data[:temp],
        conditions: data[:weather].first[:description],
        icon: data[:weather].first[:icon]
      }
    end
  end

  def daily(data)

  end
end