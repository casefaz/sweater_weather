require 'rails_helper'

RSpec.describe 'Login Endpoint' do 
  context 'happy path' do 
    it 'successfully sends a post request for user sessions' do
      create_user = {
        "email"=>"doesntgetmore@fakity.com",
        "password"=>"ThisisReal123",
        "password_confirmation"=>"ThisisReal123"
      }
  
      headers = { 'CONTENT_TYPE' => 'application/json'}

      post "/api/v1/users", headers: headers, params: JSON.generate(create_user)

      find_user = {
        "email"=>"doesntgetmore@fakity.com",
        "password"=>"ThisisReal123"
      }
    
      headers = { 'CONTENT_TYPE' => 'application/json'}

      post "/api/v1/sessions", headers: headers, params: JSON.generate(find_user)

      expect(response).to be_successful
      expect(response).to have_http_status(200)
      parsed_body = JSON.parse(response.body, symbolize_names: true)

      # binding.pry
      expect(parsed_body).to have_key(:data)
      expect(parsed_body[:data].count).to eq(3)
      expect(parsed_body[:data]).to have_key(:type)
      expect(parsed_body[:data][:type]).to eq("users")
      expect(parsed_body[:data][:attributes].count).to eq(2)
      expect(parsed_body[:data][:attributes]).to have_key(:email)
      expect(parsed_body[:data][:attributes]).to have_key(:api_key)
      expect(parsed_body[:data][:attributes]).to_not have_key(:password)
    end
  end

  context 'sad path' do 
    it 'is unsuccessful if password is bad' do 
      create_user = {
        "email"=>"doesntgetmore@fakity.com",
        "password"=>"ThisisReal123",
        "password_confirmation"=>"ThisisReal123"
      }
  
      headers = { 'CONTENT_TYPE' => 'application/json'}

      post "/api/v1/users", headers: headers, params: JSON.generate(create_user)

      find_user = {
        "email"=>"doesntgetmore@fakity.com",
        "password"=>"ThisisNotReal123"
      }
    
      headers = { 'CONTENT_TYPE' => 'application/json'}

      post "/api/v1/sessions", headers: headers, params: JSON.generate(find_user)

      expect(response).to_not be_successful
      expect(response).to have_http_status(400)
    end

    it 'doesnt work if email isnt registered' do 
      create_user = {
        "email"=>"doesntgetmore@fakity.com",
        "password"=>"ThisisReal123",
        "password_confirmation"=>"ThisisReal123"
      }
  
      headers = { 'CONTENT_TYPE' => 'application/json'}

      post "/api/v1/users", headers: headers, params: JSON.generate(create_user)

      find_user = {
        "email"=>"not_real@fakity.com",
        "password"=>"ThisisReal123"
      }
    
      headers = { 'CONTENT_TYPE' => 'application/json'}

      post "/api/v1/sessions", headers: headers, params: JSON.generate(find_user)

      expect(response).to_not be_successful
      expect(response).to have_http_status(400)
    end
  end
end