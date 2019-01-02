require "rails_helper"

RSpec.describe "GET /forecast?location=denver,co" do
  it "returns forecast data" do
    location = 'denver,co'
    get "/api/v1/forecast?location=#{location}"

    expect(response.status).to eq 200

    data = JSON.parse(response.body, symbolize_names: true)
  end
end