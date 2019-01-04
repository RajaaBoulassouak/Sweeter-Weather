require 'rails_helper'

RSpec.describe "GET /gifs?location=denver,co" do
  it "returns time, summary and a matching gif for daily weather" do
    location = 'denver,co'
    get "/api/v1/gifs?location=#{location}"

    expect(response.status).to eq 200
    
    data = JSON.parse(response.body, symbolize_names: true)

    expect(data[:data]).to be_a(Array)
    expect(data[:data].count).to eq(5)
    expect(data[:data].first.count).to eq(3)
    expect(data[:data].first[:attributes].count).to eq(3)
    expect(data[:data].first[:attributes]).to have_key(:time)
    expect(data[:data].first[:attributes]).to have_key(:summary)
    expect(data[:data].first[:attributes]).to have_key(:url)
  end
end