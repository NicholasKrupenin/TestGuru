class FeedbacksMailer < ApplicationMailer
  def feedback(feedback_params)
    @mail = feedback_params[:mail]
    @feedback = feedback_params[:text]
    mail to: Admin.first.email, from: @mail, subject: t('.subject')
  end
end
