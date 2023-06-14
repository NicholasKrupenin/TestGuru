require "test_helper"

class FeedbacksMailerTest < ActionMailer::TestCase
  test "feedback" do
    mail = FeedbacksMailer.feedback
    assert_equal "Feedback", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
