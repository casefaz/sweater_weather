require 'rails_helper'

RSpec.describe WeatherService do
  context 'happy path' do 
    it 'returns the weather based on lat long', :vcr do 
      lat = '39.7392'
      long = '-104.9903'
      
      # response = File.read('spec/fixtures/weather.json')

      # stub_request(:get, "https://api.openweathermap.org/data/2.5/onecall?appid=#{ENV['WEATHER_KEY']}&lat=39.7392&lon=104.9903&units=imperial")
      # .to_return(status: 200, body: response, headers: {})
      
      weather_response = WeatherService.get_weather(lat, long)
      expect(weather_response).to have_key(:current)
      expect(weather_response).to have_key(:hourly)
      expect(weather_response).to have_key(:daily)
      expect(weather_response[:current]).to have_key(:weather)
      expect(weather_response[:current][:weather].first).to have_key(:description)
      expect(weather_response[:current][:weather].first).to have_key(:icon)
      expect(weather_response).to_not have_key(:minutely)
      expect(weather_response).to_not have_key(:alerts)
    end
  end

  context 'sad path' do 

  end
end

