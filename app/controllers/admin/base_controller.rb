class Admin::BaseController < ApplicationController
  before_action :admin_required!

  layout 'admin'

  private

  def admin_required!
    redirect_to root_path, alert: 'You are not autorized to view this page' unless current_user.kind_of?(Admin)
  end
end
