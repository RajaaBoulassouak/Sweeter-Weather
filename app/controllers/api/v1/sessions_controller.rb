class Api::V1::SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  def create
    user = User.find_by(email: params[:email])
    user && user.authenticate(params[:password]) or not_found
    session[:user_id] = user.id
    render json: UserSerializer.new(user), status: 200
  end
  
  private
  
  def user_params
    params.require(:user).permit(:email, :password)
  end
end