class User < ApplicationRecord

  has_many :test_by_author, class_name: 'Test', foreign_key: :author_id, dependent: :destroy
  has_many :tests, through: :test_users
  has_many :test_users, dependent: :destroy

  def tests_level(level)
    tests.where(level: level)
  end
end
