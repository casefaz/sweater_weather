require 'rails_helper'

RSpec.describe RoadTripFacade do 
  it 'returns the length of the roadtrip', :vcr do 
    origin = 'Denver'
    destination = 'Chicago'

    length = RoadTripFacade.get_length(origin, destination)

    expect(length).to be_an_instance_of(RoadTrip)
    expect(length.travel_time).to eq("14:24:27")
    expect(length.origin).to eq('Denver')
    expect(length.destination).to eq('Chicago')
  end
end