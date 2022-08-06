require 'rails_helper'

RSpec.describe MapquestFacade do 
  it 'returns lat city' do 
    city = 'denver,co'

    geocoder = MapquestFacade.get_coordinates(city)
    # binding.pry
    expect(geocoder).to be_an_instance_of(Mapquest)
    expect(geocoder.lat).to eq('39.738453')
    expect(geocoder.lon).to eq('-104.984853')
  end
end