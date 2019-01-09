require 'rails_helper'

RSpec.describe 'POST /favorites' do 
  it 'favorites a location' do
    user = User.create!(email: 'whatever@example.com', password: 'password', password_confirmation: 'password')
    params =  {
                'location': 'Denver,CO',
                'api_key': "#{user.api_key}"
              }      
    post '/api/v1/favorites', params: params

    expect(response).to be_successful
    expect(response.status).to eq(201)
    
    data = JSON.parse(response.body, symbolize_names: true)
    
    expect(data).to be_a(Hash)
    expect(data[:location]).to eq(params[:location])
    expect(data[:user_id]).to eq(user.id)
  end
  
  it 'returns status 401 (Unauthorized) if incorrect key is provided' do 
    user = User.create!(email: 'whatever@example.com', password: 'password', password_confirmation: 'password')
    params =  {
                'location': 'Denver,CO',
                'api_key': "jgn983hy-4d2b-4818-97c7-62b55ed23611"
              }    
    post '/api/v1/favorites', params: params

    expect(response).to_not be_successful
    expect(response.status).to eq(404)
    
    data = JSON.parse(response.body, symbolize_names: true)
    
    expect(data[:message]).to eq('Unauthorized')
  end 
  
  it 'returns status 401 (Unauthorized) if no API key is provided' do 
    user = User.create!(email: 'whatever@example.com', password: 'password', password_confirmation: 'password')
    params =  {
                'location': 'Denver,CO'
              }    
    post '/api/v1/favorites', params: params

    expect(response).to_not be_successful
    expect(response.status).to eq(404)

    data = JSON.parse(response.body, symbolize_names: true)
    
    expect(data[:message]).to eq('Unauthorized')
  end
end

RSpec.describe 'GET /favorites' do 
  it 'lists favorite location' do
    user = User.create!(email: 'whatever@example.com', password: 'password', password_confirmation: 'password')
    favorite_1 = user.favorites.create(location: 'Denver, CO')
    favorite_2 = user.favorites.create(location: 'Golden, CO')
    params =  {
                'api_key': "#{user.api_key}"
              }

    get '/api/v1/favorites', params: params

    expect(response).to be_successful
    expect(response.status).to eq(200)
    
    data = JSON.parse(response.body, symbolize_names: true)

    expect(data[:data].count).to eq(2)
    expect(data[:data].first[:id]).to eq("Denver, CO")
    expect(data[:data].second[:id]).to eq("Golden, CO")
    expect(data[:data].first[:type]).to eq("current_weather")
    expect(data[:data].second[:type]).to eq("current_weather")
    expect(data[:data].first[:attributes]).to have_key(:temperature)
    expect(data[:data].second[:attributes]).to have_key(:temperature)
  end
  
  it 'returns status 401 (Unauthorized) if no API key is provided' do 
    user = User.create!(email: 'whatever@example.com', password: 'password', password_confirmation: 'password')
    favorite_1 = user.favorites.create(location: 'Denver, CO')
    favorite_2 = user.favorites.create(location: 'Golden, CO')
    params =  {}   
    get '/api/v1/favorites', params: params

    expect(response).to_not be_successful
    expect(response.status).to eq(404)
    
    data = JSON.parse(response.body, symbolize_names: true)
    
    expect(data[:message]).to eq('Unauthorized')
  end 
  
  it 'returns status 401 (Unauthorized) if incorrect key is provided' do 
    user = User.create!(email: 'whatever@example.com', password: 'password', password_confirmation: 'password')
    params =  {
                'api_key': "jgn983hy-4d2b-4818-97c7-62b55ed23611"
              }    
    get '/api/v1/favorites', params: params

    expect(response).to_not be_successful
    expect(response.status).to eq(404)

    data = JSON.parse(response.body, symbolize_names: true)
    
    expect(data[:message]).to eq('Unauthorized')
  end
end