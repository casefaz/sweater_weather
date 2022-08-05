require 'rails_helper'

RSpec.describe WeatherService do 
  it 'returns the weather based on lat long', :vcr do 
    lat = '39.7392'
    long = '104.9903'
    
    response = File.read('/spec/fixtures/weather.json')

    stub_request(:get, "https://api.openweathermap.org/data/2.5/weather?appid=#{ENV['WEATHER_KEY']}&lat=39.7392&lon=104.9903&units=imperial").
         with(
           headers: {
       	  'Accept'=>'*/*',
       	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       	  'User-Agent'=>'Faraday v2.4.0'
           }).
         to_return(status: 200, body: response, headers: {})

    expect(response).to be_a(Hash)
  
  end
end

