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
    end
  end
end