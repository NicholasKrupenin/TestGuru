class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :validate_answer_limit

  scope :correct, -> { where(correct: true).pluck(:body) }

  def self.validate_answer_limit
    errors.add(:answer, "can't include more than 4 answers.") if question.answers.count >= 4
  end

end
