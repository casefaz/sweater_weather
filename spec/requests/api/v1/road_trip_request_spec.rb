require "rails_helper"

RSpec.describe 'Road Trip API' do 
  context 'happy path' do 
    it 'returns road trip information', :vcr do
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
      expect(response).to have_http_status(200)

      parsed_body = JSON.parse(response.body, symbolize_names: true)

      expect(parsed_body).to have_key(:data)
      expect(parsed_body[:data].count).to eq(3)
      expect(parsed_body[:data][:type]).to eq("roadtrip")
      expect(parsed_body[:data][:attributes].count).to eq(4)
      expect(parsed_body[:data][:attributes]).to have_key(:start_city)
      expect(parsed_body[:data][:attributes][:start_city]).to be_a(String) 
      expect(parsed_body[:data][:attributes]).to have_key(:end_city)
      expect(parsed_body[:data][:attributes][:end_city]).to be_a(String)
      expect(parsed_body[:data][:attributes][:weather_at_eta].count).to eq(2)
      expect(parsed_body[:data][:attributes][:weather_at_eta]).to have_key(:temperature)
      expect(parsed_body[:data][:attributes][:weather_at_eta]).to have_key(:conditions)
    end
  end

  context 'sad path' do 
    it 'returns a 401 error with no api key', :vcr do
      user = User.create!({
        "email": "doesntgetmore@fakity.com",
        "password": "ThisisReal123",
        "password_confirmation": "ThisisReal123"
      })

      origin = 'denver,co'
      destination = 'chicago,il'

      road_trip_info = {
        "origin": origin,
        "destination": destination,
        "api_key": ""
      }
      headers = { 'CONTENT_TYPE' => 'application/json' }

      post "/api/v1/road_trip", headers: headers, params: JSON.generate(road_trip_info)

      expect(response).to_not be_successful
      expect(response).to have_http_status(401)
    end 
  end
end