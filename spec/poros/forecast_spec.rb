require 'rails_helper'

RSpec.describe Forecast do 
  it 'exists and has attributes', :vcr do 
    # lat = '39.7392'
    # long = '-104.9903'

    # data = WeatherService.get_weather(lat, long)
    lat = '39.7392'
    long = '-104.9903'
    data = WeatherService.get_weather(lat, long)
    forecast = Forecast.new(data)
    expect(forecast).to be_an_instance_of(Forecast)

  end
  
  it 'returns current weather', :vcr do 
    # lat = '39.7392'
    # long = '-104.9903'

    # data = WeatherService.get_weather(lat, long)
    lat = '39.7392'
    long = '-104.9903'
    data = WeatherService.get_weather(lat, long)
    forecast = Forecast.new(data)

    expect(forecast.current_weather).to have_key(:datetime)
    expect(forecast.current_weather[:datetime]).to be_a(String)
    expect(forecast.current_weather).to have_key(:sunrise)
    expect(forecast.current_weather).to_not have_key(:pressure)
  end

  it 'returns hourly weather', :vcr do 
    lat = '39.7392'
    long = '-104.9903'
    data = WeatherService.get_weather(lat, long)
    forecast = Forecast.new(data)

    expect(forecast.hourly_weather.count).to eq(8)
    expect(forecast.hourly_weather.first[:time]).to be_a(String)
    expect(forecast.hourly_weather.first[:time]).to eq("08:00:00 PM")
    expect(forecast.hourly_weather.first).to have_key(:icon)
    expect(forecast.hourly_weather.first).to_not have_key(:wind_gust)
  end

  it 'returns daily weather', :vcr do 
    lat = '39.7392'
    long = '-104.9903'
    data = WeatherService.get_weather(lat, long)
    forecast = Forecast.new(data)

    expect(forecast.daily_weather.count).to eq(5)
    expect(forecast.daily_weather.first).to have_key(:date)
    expect(forecast.daily_weather.first).to have_key(:max_temp)
    expect(forecast.daily_weather.first[:max_temp]).to be_a(Float)
    expect(forecast.daily_weather.first[:max_temp]).to eq(93.04)
    expect(forecast.daily_weather.first).to_not have_key(:uvi)
    expect(forecast.daily_weather.first).to_not have_key(:pop)
  end

  xit 'returns weather for a specific time and place' do 
    lat = '39.7392'
    long = '-104.9903'
    data = WeatherService.get_weather(lat, long)
    travel_forecast = Forecast.new(data)

    travel_time = "14"
    # binding.pry
    expect(travel_forecast.weather_at_eta(travel_time)).to be_a(Hash)
  end
end