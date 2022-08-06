require 'rails_helper'

RSpec.describe ForecastFacade do 
  it 'returns forecast objects' do
    coordinates = File.read("spec/fixtures/lat_lng.json")
    response = JSON.parse(coordinates, symbolize_names: true)
    binding.pry
    lat = response[:results].first[:locations].first[:latLng][:lat]
    lon = response[:results].first[:locations].first[:latLng][:lng]

    weather = WeatherService.get_weather(lat, lon)
    binding.pry
    Forecast.new(weather)
  end
end