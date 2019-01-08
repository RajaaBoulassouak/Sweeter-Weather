class Api::V1::FavoritesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authorize
  
  def index 
    favorites = user.favorites.map do |fave|
      ForecastFacade.new(fave.location).weather_forecast
    end
    render json: ForecastSerializer.new(favorites)
  end
  
  def create
    favorite = user.favorites.create(location: params[:location])
    render json: favorite, status: 201
  end
end