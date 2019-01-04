class GiphyService
  
  def initialize(summary)
    @summary = summary
  end

  def get_gif
    results = JSON.parse(response('/v1/gifs/search?').body, symbolize_names: true)
  end

  private

  def response(url)
    @response ||= conn.get(url) do |req|
      req.params['api_key'] = ENV['Giphy-Key']
      req.params['q']       = @summary
      req.params['limit']   = 1
    end
  end

  def conn
    Faraday.new(:url => 'https://api.giphy.com') do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end
end