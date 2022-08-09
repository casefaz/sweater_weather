require 'rails_helper'

RSpec.describe ForecastFacade do 
  it 'returns forecast objects', :vcr do
    city = 'denver,co'
    coordinates = MapquestService.get_lat_lng(city)

    lat = coordinates[:results].first[:locations].first[:latLng][:lat]
    lon = coordinates[:results].first[:locations].first[:latLng][:lng]


    forecast = ForecastFacade.forecast(lat, lon)

    expect(forecast).to be_an_instance_of(Forecast)
  end
end