class ForecastFacade 
  
  def initialize(filter = {})
    @filter = filter
  end 
  
  def weather_forecast 
    Forecast.new(forecast_result)
  end 
  
  private 
    
  def forecast_result
    @result ||= service.get_forecast(@filter)
  end
  
  def service 
    DarkSkyService.new
  end
end 