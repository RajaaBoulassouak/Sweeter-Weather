class Api::V1::FavoritesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authorize
  
  def index 
    favorites = current_user.favorites.map do |fave|
      ForecastFacade.new(fave.location).current_weather
    end
    render json: CurrentWeatherSerializer.new(favorites)
  end
  
  def create
    favorite = current_user.favorites.create(location: params[:location])
    render json: favorite, status: 201
  end
end