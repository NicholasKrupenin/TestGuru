module AnswersHelper
  def answer_header(answer)
    if answer.persisted?
      truncate("Edit answer to a question: #{answer.question.body}",
               length: 60, separator: ' ')
    else
      truncate("Create a new answer to a question: #{answer.question.body}",
               length: 60, separator: ' ')
    end
  end
end
