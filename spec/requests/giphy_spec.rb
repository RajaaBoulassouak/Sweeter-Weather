require 'rails_helper'

RSpec.describe "GET /gifs?location=denver,co" do
  it "returns time, summary and a matching gif for daily weather" do
    location = 'denver,co'
    get "/api/v1/gifs?location=#{location}"

    expect(response.status).to eq 200
    
    data = JSON.parse(response.body, symbolize_names: true)

    expect(data[:data]).to have_key(:attributes)
    expect(data[:data][:attributes].count).to eq(2)
    expect(data[:data][:attributes]).to have_key(:gifs)
    expect(data[:data][:attributes]).to have_key(:copyright)
    expect(data[:data][:attributes][:copyright]).to eq(2019)
    expect(data[:data][:attributes][:gifs]).to be_a(Array)
    expect(data[:data][:attributes][:gifs].count).to eq(5)
    expect(data[:data][:attributes][:gifs].first).to have_key(:time)
    expect(data[:data][:attributes][:gifs].first).to have_key(:summary)
    expect(data[:data][:attributes][:gifs].first).to have_key(:url)
  end
end