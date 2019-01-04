class Gif 
  attr_reader :time, :summary, :gif
  
  def initialize(time, summary, gif)
    @time    = time
    @summary = summary
    @gif     = gif[:fixed_width][:url]
  end 
end 