class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :hourly, :daily
end