class ForecastFacade 
  
  def initialize(filter = {})
    @filter = filter
  end 
  
  def coordinates
    geo_code_result
  end
  
  def weather_forecast
    Forecast.new(forecast_result)
  end 
  
  def weather_gifs
    gifs = weather_forecast.daily.map do |day|
      gif = GiphyService.new(day.summary).get_gif
      Gif.new(day.time, day.summary, gif)
    end
    copyright = Copyright.new
    Gifs.new(gifs, copyright.year)
  end

  private 
  
  def geo_code_result
    @result ||= geo_code_service.get_coordinates
  end
    
  def forecast_result
    @result ||= forecast_service.get_forecast(coordinates)
  end
  
  def geo_code_service 
    GeoCodeService.new(@filter) 
  end
  
  def forecast_service 
    DarkSkyService.new
  end
end 