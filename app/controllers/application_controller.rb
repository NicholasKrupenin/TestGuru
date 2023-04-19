class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!
  helper_method :current_user, :logged_in?

  private

  def authenticate_user!
    unless current_user
      cookies[:redirect_path] = request.path
      redirect_to login_path, alert: 'Verify your Email and Password please'
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end
end
