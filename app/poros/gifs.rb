class Gifs
  attr_reader :location,
              :gifs, 
              :copyright
  
  def initialize(gifs, copyright, location)
    @location  = location
    @gifs      = gifs 
    @copyright = copyright
  end
end 