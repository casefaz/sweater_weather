require 'rails_helper'

RSpec.describe Forecast do 
  it 'exists and has attributes' do 
    # lat = '39.7392'
    # long = '-104.9903'

    # data = WeatherService.get_weather(lat, long)
    data = File.read("spec/fixtures/weather.json")
    response = JSON.parse(data, symbolize_names: true)
    forecast = Forecast.new(response)
    expect(forecast).to be_an_instance_of(Forecast)

  end
  
  it 'returns current weather' do 
    # lat = '39.7392'
    # long = '-104.9903'

    # data = WeatherService.get_weather(lat, long)
    data = File.read("spec/fixtures/weather.json")
    response = JSON.parse(data, symbolize_names: true)
    forecast = Forecast.new(response)

    expect(forecast.current_weather).to have_key(:datetime)
    expect(forecast.current_weather[:datetime]).to be_a(String)
    expect(forecast.current_weather).to have_key(:sunrise)
    expect(forecast.current_weather).to_not have_key(:pressure)
  end

  it 'returns hourly weather' do 
    data = File.read("spec/fixtures/weather.json")
    response = JSON.parse(data, symbolize_names: true)
    forecast = Forecast.new(response)

    expect(forecast.hourly_weather.count).to eq(8)
    expect(forecast.hourly_weather.first[:time]).to be_a(String)
    expect(forecast.hourly_weather.first[:time]).to eq("10:00:00 AM")
    expect(forecast.hourly_weather.first).to have_key(:icon)
    expect(forecast.hourly_weather.first).to_not have_key(:wind_gust)
  end

  it 'returns daily weather' do 
    data = File.read("spec/fixtures/weather.json")
    response = JSON.parse(data, symbolize_names: true)
    forecast = Forecast.new(response)

    expect(forecast.daily_weather.count).to eq(5)
    expect(forecast.daily_weather.first).to have_key(:date)
    expect(forecast.daily_weather.first).to have_key(:max_temp)
    expect(forecast.daily_weather.first[:max_temp]).to be_a(Float)
    expect(forecast.daily_weather.first[:max_temp]).to eq(85.48)
    expect(forecast.daily_weather.first).to_not have_key(:uvi)
    expect(forecast.daily_weather.first).to_not have_key(:pop)
  end

  it 'returns weather for a specific time and place' do 
    travel_time = "14"

    data = File.read("spec/fixtures/weather.json")
    response = JSON.parse(data, symbolize_names: true)
    travel_forecast = Forecast.new(response)
    binding.pry
    expect(travel_forecast.weather_at_eta(travel_time)).to be_a(Hash)
  end
end