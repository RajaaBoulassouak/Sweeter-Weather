class GeoCodeService 
  
  def initialize(location)
    @location = location 
  end
  
  def get_coordinates
    results = JSON.parse(response('/maps/api/geocode/json?').body, symbolize_names: true)
    results[:results].first[:geometry][:location]
  end

  private

  def response(url)
    @response ||= conn.get(url) do |req|
      req.params['address'] = @location
      req.params['key']     = ENV['Geo-Code-Key']
    end
  end

  def conn
    Faraday.new(:url => 'https://maps.googleapis.com') do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end
end
