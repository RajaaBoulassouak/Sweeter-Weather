class Api::V1::GifsController < ApplicationController
  
  def index 
    gifs = ForecastFacade.new(params[:location]).weather_gifs
    render json: GifsSerializer.new(gifs)
  end
end