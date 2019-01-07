class Gifs
  attr_reader :gifs, 
              :copyright, 
              :filter
  
  def initialize(gifs, copyright, filter)
    @filter    = filter
    @gifs      = gifs 
    @copyright = copyright
  end
end 