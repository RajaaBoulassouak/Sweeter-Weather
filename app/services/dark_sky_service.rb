class DarkSkyService 
  
  def get_forecast(coordinates)
    get_json("/forecast/#{ENV['Dark-Sky-Key']}/#{coordinates[:lat]},#{coordinates[:lng]}")
  end 
  
  private 
    
  def get_json(url)
    JSON.parse(conn.get(url).body, symbolize_names: true)
  end
  
  def conn 
    Faraday.new(:url => 'https://api.darksky.net') do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end
end 