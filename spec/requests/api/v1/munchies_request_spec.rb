require 'rails_helper'

RSpec.describe 'Muchies API' do 
  it 'returns the requested information' do 
    city = 'denver,co'
    type = 'chinese'
    weather = File.read('spec/fixtures/weather.json')

    get "/api/v1/munchies?location=#{city}&food=#{type}"

    expect(response).to be_successful
    expect(response).to have_http_status(200)
  end
end