class Api::V1::FavoritesController < ApplicationController
  before_action :authorize
  
  def create
    # render json: { message: "Unauthorized" }, status: 404 unless user
    favorite = user.favorites.create(location: params[:location])
    render json: favorite, status: 201
  end
end 