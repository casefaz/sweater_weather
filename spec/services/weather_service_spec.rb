require 'rails_helper'

RSpec.describe WeatherService do 
  it 'returns the weather based on lat long', :vcr do 
    lat = '39.7392'
    long = '104.9903'
    
    response = File.read('spec/fixtures/weather.json')

    stub_request(:get, "https://api.openweathermap.org/data/2.5/onecall?appid=#{ENV['WEATHER_KEY']}&lat=39.7392&lon=104.9903&units=imperial")
    .to_return(status: 200, body: response, headers: {})
    
    weather_response = WeatherService.get_weather(lat, long)
    expect(weather_response).to have_key(:current)
  
  end
end

