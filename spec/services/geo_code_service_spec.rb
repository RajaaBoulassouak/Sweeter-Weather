require 'rails_helper'

RSpec.describe GeoCodeService do 
  it 'exists' do
    location = 'denver,co'
    service = GeoCodeService.new(location)

    expect(service).to be_a(GeoCodeService)
  end

  it 'gets the most dangerous days data' do 
    location = 'denver,co'
    service = GeoCodeService.new(location)
    coordinates = service.get_coordinates
    
    expect(coordinates).to be_a(Hash)
    expect(coordinates[:lat]).to eq(39.7392358)
    expect(coordinates[:lng]).to eq(-104.990251)
  end 
end