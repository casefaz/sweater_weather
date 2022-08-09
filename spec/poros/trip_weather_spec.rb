require 'rails_helper'

RSpec.describe TripWeather do 
  it 'exists and has attributes', :vcr do 
    lat = '39.7392'
    long = '-104.9903'
    origin = 'denver,co'
    destination = 'detroit,mi'
    weather_data = WeatherService.get_weather(lat, long)
    travel_data = RoadTripFacade.get_length(origin, destination)
    arrival_weather = TripWeather.new(weather_data, travel_data)

    expect(arrival_weather).to be_an_instance_of(TripWeather)
    expect(arrival_weather.data).to eq(weather_data)
    expect(arrival_weather.travel_data).to eq(travel_data)
  end

  it 'returns unlimited hourly weather', :vcr do 
    lat = '39.7392'
    long = '-104.9903'
    origin = 'denver,co'
    destination = 'detroit,mi'
    weather_data = WeatherService.get_weather(lat, long)
    travel_data = RoadTripFacade.get_length(origin, destination)
    forecast = TripWeather.new(weather_data, travel_data)

    expect(forecast.full_hours(weather_data).count).to eq(48)
    expect(forecast.full_hours(weather_data).first[:time]).to be_a(String)
    expect(forecast.full_hours(weather_data).first[:time]).to eq("10:00:00 AM")
    expect(forecast.full_hours(weather_data).first).to have_key(:icon)
    expect(forecast.full_hours(weather_data).first).to_not have_key(:wind_gust)
  end

  it 'returns weather for a specific time and place', :vcr do 
    lat = '39.7392'
    long = '-104.9903'
    origin = 'denver,co'
    destination = 'detroit,mi'
    weather_data = WeatherService.get_weather(lat, long)
    travel_data = RoadTripFacade.get_length(origin, destination)
    travel_forecast = TripWeather.new(weather_data, travel_data)

    expected = {
      :temperature=>74.53, 
      :conditions=>"clear sky"
    }
    expect(travel_forecast.weather_at_eta).to be_a(Hash)
    expect(travel_forecast.weather_at_eta).to eq(expected)
  end
end