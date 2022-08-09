require 'rails_helper'

RSpec.describe TripWeatherFacade do 
  it 'returns poro objects with service data', :vcr do
    lat = '39.7392'
    long = '-104.9903'
    origin = 'denver,co'
    destination = 'detroit,mi'

    eta = TripWeatherFacade.get_arrival_weather(lat, long, origin, destination)
    expect(eta).to be_an_instance_of(TripWeather)
  end
end