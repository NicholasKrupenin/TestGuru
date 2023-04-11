module AnswersHelper
  def answer_header(answer)
    if answer.persisted?
      "Edit answer to a question: #{answer.question.body[0,20]}..."
    else
      "Create a new answer to a question: #{answer.question.body[0,20]}..."
    end
  end
end
