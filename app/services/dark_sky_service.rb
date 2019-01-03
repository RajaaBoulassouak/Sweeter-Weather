class DarkSkyService 
  
  def get_forecast(coordinates)
    coordinates = '37.8267,-122.4233'
    get_json("/forecast/#{ENV['Dark-Sky-Key']}/#{coordinates}")
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