class CurrentWeatherSerializer
  include FastJsonapi::ObjectSerializer
  set_id      :location
  
  attributes  :time,
              :summary,
              :icon,
              :temperature,
              :feels_like
end