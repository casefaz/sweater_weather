class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  validates_presence_of :password
  validates_uniqueness_of :api_key

  has_secure_password

  before_create do 
    self[:api_key] = generate_key
  end 

  def generate_key
    SecureRandom.hex(13)
  end
end