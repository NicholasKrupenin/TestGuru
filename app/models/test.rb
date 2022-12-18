class Test < ApplicationRecord

  belongs_to :user
  belongs_to :category

  has_many :test_users
  has_many :questions
  has_many :users, through: :test_users

  def self.tests_by_category(title_category)
    joins('JOIN categories ON tests.category_id = categories.id')
      .where(categories: { title: title_category })
      .order(title: :desc)
      .pluck(:title)
  end
end
