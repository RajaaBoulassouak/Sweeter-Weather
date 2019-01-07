require 'rails_helper'

RSpec.describe 'POST /users' do 
  it 'returns unique user api_key' do
    user_params = {
                    'email': 'whatever@example.com', 
                    'password': 'password',
                    'password_confirmation': 'password'
                  }
    post '/api/v1/users', params: user_params
    user = User.last

    expect(response).to be_successful
    expect(response.status).to eq(201)
    expect(user.email).to eq(user_params[:email]) 
    
    data = JSON.parse(response.body, symbolize_names: true)

    expect(data[:data][:attributes]).to have_key(:api_key)
    expect(data[:data][:attributes][:api_key]).to eq(user.api_key)
  end
end