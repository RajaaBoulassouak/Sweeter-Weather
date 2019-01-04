class GifsSerializer
  include FastJsonapi::ObjectSerializer
  attributes :time, 
             :summary, 
             :url
end