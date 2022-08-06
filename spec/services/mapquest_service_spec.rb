require 'rails_helper'

RSpec.describe MapquestService do 
  it 'returns the data for the station closest to Turing' do 
    city = 'Denver,CO'

    response = MapquestService.get_lat_lng(city)

    expect(response).to be_an(Hash)
    expect(response).to have_key(:results)
    expect(response[:results].first).to have_key(:locations)
    expect(response[:results].first[:locations].first).to have_key(:latLng)
    expect(response[:results].first[:locations].first[:latLng]).to have_key(:lng)
    expect(response[:results].first[:locations].first[:latLng]).to have_key(:lat)
  end
end