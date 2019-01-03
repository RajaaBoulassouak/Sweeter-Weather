class Forecast 
  attr_reader :id, :hourly, :daily

  def initialize(data)
    @id     = id
    @hourly = data[:hourly]
    @daily  = data[:daily]
  end
end