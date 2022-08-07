require 'rails_helper'

RSpec.describe "User Sign Up API" do
  context 'happy path' do 
    it 'exposes the sign up endpoint' do 
      user_info = {
        "user" => {
          "email"=>"doesntgetmore@fakity.com",
          "password"=>"ThisisReal123",
          "password_confirmation"=>"ThisisReal123"
        }
      }
      headers = { 'CONTENT_TYPE' => 'application/json'}

      post "/api/v1/users", headers: headers, params: JSON.generate(user_info)

      expect(response).to be_successful
      expect(response).to have_http_status(201)
      parsed_body = JSON.parse(response.body, symbolize_names: true)


    end
  end
end 