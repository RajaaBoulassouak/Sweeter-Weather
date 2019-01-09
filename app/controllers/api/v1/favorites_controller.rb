class Api::V1::FavoritesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authorize
  
  def index 
    render json: CurrentWeatherSerializer.new(favorites)
  end
  
  def create
    favorite = current_user.favorites.create(location: params[:location])
    render json: favorite, status: 201
  end
  
  def destroy 
    Favorite.find_by(location: params[:location]).delete
    render json: CurrentWeatherSerializer.new(favorites)
  end
  
  private 
  
  def favorites 
    current_user.favorites.map do |fave|
      ForecastFacade.new(fave.location).current_weather
    end
  end
end