require 'rails_helper'

RSpec.describe "POST /sessions" do 
  it "returns registered user's api_key" do
    user = User.create(email: 'whatever@example.com', password: 'password', api_key: 'jgn983hy-4d2b-4818-97c7-62b55ed23611')
    
    post "/api/v1/sessions?email=#{user.email}&password=#{user.password}"
    
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    expect(response).to be_successful
    expect(response.status).to eq(200)
    
    data = JSON.parse(response.body, symbolize_names: true)
    
    expect(data[:data][:attributes]).to have_key(:api_key)
    expect(data[:data][:attributes][:api_key]).to eq(user.api_key)
  end
end