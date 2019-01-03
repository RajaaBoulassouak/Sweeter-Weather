require 'rails_helper'

RSpec.describe DarkSkyService do 
  it 'exists' do
    service = DarkSkyService.new

    expect(service).to be_a(DarkSkyService)
  end

  it 'gets forecast data' do 
    coordinates = {:lat => 39.7392358, :lng => -104.990251}
    service = DarkSkyService.new
    forecast_data = service.get_forecast(coordinates)
    expect(forecast_data.count).to eq(9)
    expect(forecast_data[:latitude]).to eq(39.7392358)
    expect(forecast_data[:longitude]).to eq(-104.990251)
    expect(forecast_data[:timezone]).to eq('America/Denver')
    expect(forecast_data).to have_key(:currently)
  end 
end