require 'rails_helper'

RSpec.describe GiphyService do 
  it 'exists' do
    summary = 'snow'
    service = GiphyService.new(summary)

    expect(service).to be_a(GiphyService)
  end

  it 'gets gif data' do 
    summary = 'snow'
    service = GiphyService.new(summary)
    gif_data = service.get_gif
    
    expect(gif_data).to have_key(:fixed_width)
    expect(gif_data[:fixed_width]).to have_key(:url)
  end
end