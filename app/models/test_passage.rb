class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_current_question, on: %i[create update]

  delegate :level, :timer, to: :test

  SUCCESS_RATIO = 85

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    save!
  end

  def test_ratio
    (correct_questions.to_f / test.questions.count) * 100
  end

  def successful?
    test_ratio >= SUCCESS_RATIO
  end

  def update_success
    update(success: successful?) if successful?
  end

  def current_question_number
    test.questions.order(:id).where('id <= ?', current_question.id).count
  end

  def total_questions
    test.questions.count
  end

  private

  def before_validation_set_current_question
    self.current_question = next_question
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.to_a.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    if current_question.nil?
      test.questions.first
    else
      test.questions.order(:id).where('id > ?', current_question.id).first
    end
  end
end
