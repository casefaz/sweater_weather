require 'rails_helper'

RSpec.describe RoadTripFacade do 
  it 'returns the length of the roadtrip', :vcr do 
    origin = 'denver,co'
    destination = 'chicago,il'

    length = RoadTripFacade.get_length(origin, destination)

    expect(length).to be_an_instance_of(RoadTrip)
    expect(length.length).to eq("14:24:27")
  end
end