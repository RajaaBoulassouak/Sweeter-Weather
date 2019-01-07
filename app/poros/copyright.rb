class Copyright 
  attr_reader :year
  
  def initialize
    @year = Time.now.year
  end
end 