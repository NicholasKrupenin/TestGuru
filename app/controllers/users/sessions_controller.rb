# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  def create
    super
    flash[:notice] = "Welcome #{current_user.first_name}! You are logged in as #{current_user.type}!"
  end
end
