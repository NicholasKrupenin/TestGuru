class User < ApplicationRecord
  has_many :test_by_author, class_name: 'Test', foreign_key: :author_id,dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages

  validates :email, presence: true, uniqueness: {scope: :email, message: 'Email already exists'},
                        format: { with: URI::MailTo::EMAIL_REGEXP, message: 'Email is invalid' }

  has_secure_password

  def tests_level(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
