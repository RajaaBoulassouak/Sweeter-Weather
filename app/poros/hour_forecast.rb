class HourForecast 
  attr_reader :time,
              :icon,
              :temperature
              
  def initialize(data)
    @time        = data[:time]
    @icon        = data[:icon]
    @temperature = data[:temperature]
  end
end