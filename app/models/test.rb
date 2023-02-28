class Test < ApplicationRecord

  belongs_to :author, class_name: 'User'
  belongs_to :category

  has_many :test_users, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_many :users, through: :test_users

  validates :title, presence: true, uniqueness: { scope: :level, message: "%{attribute} - %{value} are not unique in this title" }
  validates :level, numericality: { greater_than_or_equal_to: 0, only_integer: true, message: "%{value} seems wrong" }

  scope :single_level, ->(arg) { where(level: arg) }
  
  scope :plain, -> { single_level(0..1) }
  scope :middle, -> { single_level(2..3) }
  scope :difficult, -> { single_level(4..Float::INFINITY) }

  scope :tests_by_category, ->(arg) { joins(:category).where(categories: { title: arg }).order(title: :desc).pluck(:title) }

end
