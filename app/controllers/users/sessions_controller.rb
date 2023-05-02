# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  def create
    super
    flash[:notice] = t('.logged', name: current_user.first_name, type: current_user.type)
  end
end
#'controllers.users.sessions.create.logged'