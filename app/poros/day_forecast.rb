class DayForecast 
  attr_reader :summary, 
              :icon, 
              :precip,
              :precip_type,
              :low,
              :high
              
  
  def initialize(data)
    @summary     = data[:summary]
    @icon        = data[:icon]
    @precip      = data[:precipProbability]
    @precip_type = data[:precipType]
    @low         = data[:temperatureMin]
    @high        = data[:temperatureMax]
  end
end