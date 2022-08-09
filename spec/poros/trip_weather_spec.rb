require 'rails_helper'

RSpec.describe TripWeather do 
  it 'exists and has attributes', :vcr do 
    lat = '39.7392'
    long = '-104.9903'
    origin = 'denver,co'
    destination = 'detroit,mi'
    weather_data = WeatherService.get_weather(lat, long)
    road_time = RoadTripFacade.get_length(origin, destination)
    travel = road_time.travel_time
    arrival_weather = TripWeather.new(weather_data, travel)

    expect(arrival_weather).to be_an_instance_of(TripWeather)
  end

  it 'returns unlimited hourly weather', :vcr do 
    lat = '39.7392'
    long = '-104.9903'
    origin = 'denver,co'
    destination = 'detroit,mi'
    weather_data = WeatherService.get_weather(lat, long)
    road_time = RoadTripFacade.get_length(origin, destination)
    travel = road_time.travel_time
    forecast = TripWeather.new(weather_data, travel)

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
    road_time = RoadTripFacade.get_length(origin, destination)
    # binding.pry
    travel = road_time.travel_time
    travel_forecast = TripWeather.new(weather_data, travel)

    expected = {
      :temperature=>74.53, 
      :conditions=>"clear sky"
    }
    expect(travel_forecast.weather_at_eta).to be_a(Hash)
    expect(travel_forecast.weather_at_eta).to eq(expected)
  end
end