class CurrentWeather
  attr_reader :location,
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
              :today

  def initialize(data, location)
    @location    = location
    @latitude    = data[:latitude]
    @longitude   = data[:longitude]
    @time        = date_time(data[:currently][:time])
    @summary     = data[:currently][:summary]
    @icon        = data[:currently][:icon]
    @temperature = (data[:currently][:temperature]).round
    @feels_like  = data[:currently][:apparentTemperature].round
    @humidity    = data[:currently][:humidity]*100
    @uv_index    = data[:currently][:uvIndex]
    @visibility  = data[:currently][:visibility]
    @today       = data[:daily][:data].first[:summary]
  end
  
  private
  
  def date_time(time)
    Time.at(time).to_datetime
  end
end