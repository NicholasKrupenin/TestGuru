class User < ApplicationRecord
  def tests_level(level)
    Test.joins('JOIN test_users ON test_users.test_id = tests.id')
      .where(tests: { level: level} )
      .where(test_users: { user_id: id })
  end
end
