require "rails_helper"

RSpec.describe 'Road Trip API' do 
  context 'happy path' do 
    it 'returns road trip information' do
      user = User.create!({
        "email": "doesntgetmore@fakity.com",
        "password": "ThisisReal123",
        "password_confirmation": "ThisisReal123"
      })

      origin = 'denver,co'
      destination = 'chicago,il'
      api_key = user.api_key

      road_trip_info = {
        "origin": origin,
        "destination": destination,
        "api_key": api_key
      }
      headers = { 'CONTENT_TYPE' => 'application/json' }

      post "/api/v1/road_trip", headers: headers, params: JSON.generate(road_trip_info)

      expect(response).to be_successful
    end
  end
end