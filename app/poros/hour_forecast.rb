class HourForecast 
  attr_reader :time,
              :icon,
              :temperature
              
  def initialize(data)
    @time        = date_time(data[:time])
    @icon        = data[:icon]
    @temperature = data[:temperature].round
  end
  
  private
  
  def date_time(time)
    Time.at(time).to_datetime
  end
end