class GifsSerializer
  include FastJsonapi::ObjectSerializer
  set_id     :location
  
  attributes :gifs, 
             :copyright
end