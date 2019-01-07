class GifsSerializer
  include FastJsonapi::ObjectSerializer
  
  set_id :filter
  attributes :gifs, 
             :copyright
end