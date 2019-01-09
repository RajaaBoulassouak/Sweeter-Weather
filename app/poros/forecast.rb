class Forecast 
  attr_reader :location, 
              :current_weather, 
              :hourly_forecast, 
              :daily_forecast
            
  def initialize(current_weather, hourly_forecast, daily_forecast, locatiom)  
    @location        = location       
    @current_weather = current_weather
    @hourly_forecast = hourly_forecast
    @daily_forecast  = daily_forecast
  end 
end 