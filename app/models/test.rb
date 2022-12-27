class Test < ApplicationRecord

  belongs_to :author, class_name: 'User'
  belongs_to :category

  has_many :test_users, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_many :users, through: :test_users

  def self.tests_by_category(title_category)
    joins(:category)
      .where(categories: { title: title_category })
      .order(title: :desc)
      .pluck(:title)
  end
end
