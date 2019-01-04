class Api::V1::UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  def create 
    user = User.create(user_params)
    render json: UserSerializer.new(user), status: 201 if user.save
  end
  
  private
  
  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end