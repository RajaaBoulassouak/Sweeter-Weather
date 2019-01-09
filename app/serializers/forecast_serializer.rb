class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  set_id      :location
  
  attributes  :current_weather,
              :hourly_forecast,
              :daily_forecast
end