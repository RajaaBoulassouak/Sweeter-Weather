class Api::V1::SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  def create
    user = User.find_by(email: user_params[:email])
    (user && user.authenticate(user_params[:password])) or (not_found && return)
    session[:user_id] = user.id
    render json: UserSerializer.new(user), status: 200 
  end
  
  private
  
  def user_params
    params.permit(:email, :password)
  end
end