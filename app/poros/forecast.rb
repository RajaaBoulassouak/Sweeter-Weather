class Forecast 
  attr_reader :id, 
              :latitude,
              :longitude,
              :time,
              :summary,
              :icon,
              :temperature,
              :feels_like,
              :humidity,
              :uv_index,
              :visibility,
              :today,
              :hourly, 
              :daily

  def initialize(data)
    @id        = id
    @latitude    = data[:latitude]
    @longitude   = data[:longitude]
    @time        = data[:currently][:time]
    @summary     = data[:currently][:summary]
    @icon        = data[:currently][:icon]
    @temperature = data[:currently][:temperature]
    @feels_like  = data[:currently][:apparentTemperature]
    @humidity    = data[:currently][:humidity]
    @uv_index    = data[:currently][:uvIndex]
    @visibility  = data[:currently][:visibility]
    @today       = data[:hourly][:summary]
    @hourly      = hourly_forecast(data[:hourly])
    @daily       = daily_forecast(data[:daily])
  end
  
  def hourly_forecast(hourly_data)
    hourly_data[:data][0..7].map do |hour_data|
      HourForecast.new(hour_data)
    end
  end
  
  def daily_forecast(daily_data)
    daily_data[:data][0..4].map do |day_data|
      DayForecast.new(day_data)
    end
  end
end