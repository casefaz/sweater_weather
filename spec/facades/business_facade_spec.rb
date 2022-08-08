require 'rails_helper'

RSpec.describe BusinessFacade do 
  it 'returns poros objects with attributes from service' do 
    city = 'denver,co'
    type = 'chinese'

    restaurants = BusinessFacade.find_restaurants(city, type)

    expect(restaurants).to be_an(Array)
    expect(restaurants).to be_all(Business)
    expect(restaurants.first.name).to eq("Taste of China")
    expect(restaurants.first.name).to be_a(String)
    expect(restaurants.first.address).to eq("1935 Federal Blvd, Denver, CO 80204")
    expect(restaurants.first.address).to be_a(String)
  end
end