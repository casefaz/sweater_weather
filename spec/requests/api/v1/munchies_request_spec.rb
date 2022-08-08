require 'rails_helper'

RSpec.describe 'Muchies API' do
  context 'happy path' do 
    it 'returns the requested information' do 
      city = 'denver,co'
      type = 'chinese'
      # weather = File.read('spec/fixtures/weather.json')

      get "/api/v1/munchies?location=#{city}&food=#{type}"
      # binding.pry
      expect(response).to be_successful
      expect(response).to have_http_status(200)

      yum = JSON.parse(response.body, symbolize_names: true)
      # binding.pry
      expect(yum).to be_a(Hash)
      expect(yum).to have_key(:data)
      expect(yum[:data].count).to eq(3)
      expect(yum[:data][:type]).to eq("munchie")
      expect(yum[:data][:attributes].count).to eq(3)
      expect(yum[:data][:attributes]).to have_key(:destination_city)
      expect(yum[:data][:attributes][:forecast]).to have_key(:summary)
      expect(yum[:data][:attributes][:forecast]).to have_key(:temperature)
      expect(yum[:data][:attributes][:restaurant]).to have_key(:name)
      expect(yum[:data][:attributes][:restaurant]).to have_key(:address)
    end
  end

  context 'sad path' do 
    it 'returns an error if location is missing' do 
      city = ''
      type = 'chinese'
      # weather = File.read('spec/fixtures/weather.json')

      get "/api/v1/munchies?location=#{city}&food=#{type}"

      expect(response).to_not be_successful
      expect(response).to have_http_status(400)
    end
  end
end