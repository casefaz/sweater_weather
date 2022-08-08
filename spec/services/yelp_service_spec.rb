require 'rails_helper'

RSpec.describe YelpService do 
  it 'returns business data' do 
    location = 'denver,co'
    type = 'chinese'

    business_response = YelpService.get_restaurants(location, type)
    expect(business_response).to be_a(Hash)
    expect(business_response).to have_key(:businesses)
    expect(business_response[:businesses]).to have_key(:name)
    expect(business_response[:businesses]).to have_key(:location)
    expect(business_response[:businesses][:location]).to have_key(:address1)
    expect(business_response[:businesses][:location]).to have_key(:address2)
    expect(business_response[:businesses][:location]).to have_key(:city)
    expect(business_response[:businesses][:location]).to have_key(:zip_code)
    expect(business_response[:businesses][:location]).to have_key(:state)
  end
end