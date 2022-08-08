require 'rails_helper'

RSpec.describe BusinessFacade do 
  it 'returns poros objects with attributes from service' do 
    city = 'denver,co'
    type = 'chinese'

    restaurant = BusinessFacade.find_restaurants(city, type)

    expect(restaurant).to be_an_instance_of(Business)
    expect(restaurant.name).to eq("Taste of China")
    expect(restaurant.address).to eq("1935 Federal Blvd, Denver, CO 80204")
  end
end