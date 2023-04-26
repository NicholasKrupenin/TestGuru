class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name first_name last_name])
  end

  def after_sign_in_path_for(_resource)
    flash[:notice] = "Welcome #{current_user.first_name}! You are logged in as #{current_user.type}!"
    current_user.kind_of?(Admin) ? admin_tests_path : tests_path
  end
end
