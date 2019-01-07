class Api::V1::FavoritesController < ApplicationController
  before_action :authorize
  
  def create
    favorite = user.favorites.create(location: params[:location])
    render json: favorite, status: 201
  end
end 
