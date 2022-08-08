require 'rails_helper'

RSpec.describe User, type: :model do 
  describe 'validations' do 
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_uniqueness_of(:api_key)}
  end

  describe 'instance methods' do 
    it 'generates a random API key' do
      user_data = {
        "email": "emails4fakers@fake.net",
        "password": "SillyGoober55",
        "password_confirmation": "SillyGoober55"
      }
      user = User.new(user_data)
      expect(user.generate_key.length).to eq(26)
    end
  end
end