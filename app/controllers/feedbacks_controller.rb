class FeedbacksController < ApplicationController
  def new; end

  def create
    feedback_params = { user: current_user, text: params[:text] }
    if feedback_params[:text].present?
      FeedbacksMailer.feedback(feedback_params).deliver_now
      redirect_to root_path, notice: t('.success')
    else
      render :new, alert: t('.error')
    end
  end
end
