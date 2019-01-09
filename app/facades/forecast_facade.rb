class ForecastFacade
  attr_reader :filter
  
  def initialize(filter = {})
    @filter = filter
  end
  
  def weather_forecast
    Forecast.new(current_weather, hourly_forecast, daily_forecast, @filter)
  end 
  
  def current_weather
    CurrentWeather.new(forecast_result, @filter)
  end
    
  def weather_gifs
    Gifs.new(gifs, copyright.year, @filter)
  end
  
  private 
  
  def hourly_forecast
    forecast_result[:hourly][:data][0..7].map do |hour_data|
      HourForecast.new(hour_data)
    end
  end
  
  def daily_forecast
    forecast_result[:daily][:data][0..4].map do |day_data|
      DayForecast.new(day_data)
    end
  end
  
  def gifs
    daily_forecast.map do |day|
      gif = GiphyService.new(day.summary).get_gif
      Gif.new(day.time, day.summary, gif)
    end
  end
  
  def copyright
    Copyright.new
  end
  
  def coordinates
    geo_code_result
  end
  
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