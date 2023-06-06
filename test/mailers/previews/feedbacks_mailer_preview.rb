# Preview all emails at http://localhost:3000/rails/mailers/feedbacks_mailer
class FeedbacksMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/feedbacks_mailer/feedback
  def feedback
    FeedbacksMailer.feedback
  end

end
