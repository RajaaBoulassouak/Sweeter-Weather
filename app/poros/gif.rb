class Gif 
  attr_reader :id, :time, :summary, :url
  
  def initialize(time, summary, gif)
    @id      = id
    @time    = time
    @summary = summary
    @url     = gif[:fixed_width][:url]
  end 
end 