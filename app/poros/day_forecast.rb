class DayForecast 
  attr_reader :time,
              :summary, 
              :icon, 
              :precip,
              :precip_type,
              :low,
              :high
              
  
  def initialize(data)
    @time        = date_time(data[:time])
    @summary     = data[:summary]
    @icon        = data[:icon]
    @precip      = data[:precipProbability]*100
    @precip_type = data[:precipType]
    @low         = data[:temperatureMin].round
    @high        = data[:temperatureMax].round
  end
  
  private
  
  def date_time(time)
    Time.at(time).to_datetime
  end
end