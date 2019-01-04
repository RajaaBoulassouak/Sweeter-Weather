class GifsSerializer
  include FastJsonapi::ObjectSerializer
  attributes :gifs, 
             :copyright
end