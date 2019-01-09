require 'rails_helper'

RSpec.describe 'POST /sessions' do 
  it "returns registered user's api_key" do
    user = User.create!(email: 'whatever@example.com', password: 'password', password_confirmation: 'password')
    user_params = { 
                    'email': 'whatever@example.com', 
                    'password': 'password' 
                  }
    post '/api/v1/sessions', params: user_params

    expect(response).to be_successful
    expect(response.status).to eq(200)
    
    data = JSON.parse(response.body, symbolize_names: true)
    
    expect(data[:data][:attributes]).to have_key(:api_key)
    expect(data[:data][:attributes][:api_key]).to eq(user.api_key)
  end

  it "raises error if authentication faills" do
    user = User.create!(email: 'whatever@example.com', password: 'password', password_confirmation: 'password')
    user_params = { 
                    'email': 'whatever@example.com', 
                    'password': 'password_123' 
                  }
    post '/api/v1/sessions', params: user_params
    
    expect(response).to_not be_successful
    expect(response.status).to eq(401)
    
    data = JSON.parse(response.body, symbolize_names: true)
    
    expect(data[:message]).to eq('Invalid Credentials')
  end
end