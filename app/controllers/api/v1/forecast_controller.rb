class Api::V1::ForecastController < ApplicationController  
  
  def index 
    forecast = ForecastFacade.new(params[:location]).weather_forecast
    render json: ForecastSerializer.new(forecast)
  end
end 