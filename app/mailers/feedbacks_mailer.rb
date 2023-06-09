class FeedbacksMailer < ApplicationMailer
  def feedback(feedback_params)
    @user = feedback_params[:user]
    @mail = feedback_params[:user].email
    @feedback = feedback_params[:text]
    mail to: Admin.first.email, from: @mail, subject: t('.subject')
  end
end
