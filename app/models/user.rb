class User < ApplicationRecord
  before_create :generate_api_key 
  
  validates :email, uniqueness: true, presence: true
  validates_presence_of :password
  validates_presence_of :password_confirmation, on: :create
  
  has_secure_password
  has_many :favorites
  
  private
  
  def generate_api_key
    self.api_key = SecureRandom.uuid 
  end
end