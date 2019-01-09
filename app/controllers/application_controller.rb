class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  
  def authorize
    render json: { message: 'Unauthorized' }, status: 404 unless current_user
  end
  
  def current_user 
    @user ||=  User.find_by(api_key: params[:api_key]) if params[:api_key]
  end

  def not_found
    render json: { message: 'Invalid Credentials' }, status: 401
  end
end