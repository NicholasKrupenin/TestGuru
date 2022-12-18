class User < ApplicationRecord

  has_many :test_by_author, class_name: 'Test', foreign_key: :author_id
  has_many :tests, through: :test_users
  has_many :test_users

  def tests_level(level)
    Test.joins('JOIN test_users ON test_users.test_id = tests.id')
      .where(tests: { level: level} )
      .where(test_users: { user_id: id })
  end
end
