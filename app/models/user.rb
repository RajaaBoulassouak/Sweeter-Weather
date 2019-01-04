class User < ApplicationRecord
  before_create :generate_api_key
  validates_presence_of :email, :password
# validates :email, uniqueness: true, presence: true
  
  has_secure_password
  
  def generate_api_key
    self.api_key = SecureRandom.uuid 
  end
end