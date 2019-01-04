class Api::V1::SessionsController < ApplicationController
  
  
  def create 
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password]) 
      session[:user_id] = user.id
    end
  end
  
  private
  
  def user_params
    params.permit(:email, :password)
  end
end