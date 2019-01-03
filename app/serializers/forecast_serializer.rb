class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes  :latitude,
              :longitude,
              :time,
              :summary,
              :icon,
              :temperature,
              :feels_like,
              :humidity,
              :uv_index,
              :visibility,
              :today,
              :hourly, 
              :daily
end