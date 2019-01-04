class Gif 
  attr_reader :time, 
              :summary, 
              :url
  
  def initialize(time, summary, gif)
    @time    = time
    @summary = summary
    @url     = gif[:fixed_width][:url]
  end
end 