class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :user
 
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def authorize
    render json: { message: "Unauthorized" }, status: 404 unless user
  end
  
  def user 
    @user ||=  User.find_by(api_key: params[:api_key]) if params[:api_key]
  end

  def not_found
    raise ActionController::RoutingError.new('Invalid Credentials')
  end
end