require 'rails_helper'

RSpec.describe MapquestService do 
  it 'returns lat lon coordinates' do 
    city = 'Denver,CO'

    response = MapquestService.get_lat_lng(city)

    expect(response).to be_an(Hash)
    expect(response).to have_key(:results)
    expect(response[:results].first).to have_key(:locations)
    expect(response[:results].first[:locations].first).to have_key(:latLng)
    expect(response[:results].first[:locations].first[:latLng]).to have_key(:lng)
    expect(response[:results].first[:locations].first[:latLng]).to have_key(:lat)
  end

  it 'finds the distance between two points in time' do 
    origin = "denver,co"
    destination = "chicago,il"

    response = MapquestService.get_travel_info(origin, destination)

    expect(response).to be_a(Hash)
    expect(response).to have_key(:route)
    expect(response[:route]).to have_key(:formattedTime)
  end
end