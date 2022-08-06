require 'rails_helper'

RSpec.describe ForecastFacade do 
  it 'returns forecast objects' do
    coordinates = File.read("spec/fixtures/lat_lng.json")
    response = JSON.parse(coordinates, symbolize_names: true)

    lat = response[:results].first[:locations].first[:latLng][:lat]
    lon = response[:results].first[:locations].first[:latLng][:lng]


    forecast = ForecastFacade.forecast(lat, lon)

    expect(forecast).to be_an_instance_of(Forecast)
  end
end