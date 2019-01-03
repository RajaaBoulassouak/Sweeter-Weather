require 'rails_helper'

RSpec.describe "POST /users" do 
  it "returns unique user api_key" do
    user_info = {
                  "email": "whatever@example.com",
                  "password": "password",
                  "password_confirmation": "password"
                }
    post "/api/v1/users"
    
    user = User.last

    expect(response).to be_successful
    expect(user.email).to eq("whatever@example.com") 
    
    data = JSON.parse(response.body, symbolize_names: true)
    
    expect(data).to have_key(:api_key)
    expect(data[:api_key]).to eq(user.api_key)
  end
end