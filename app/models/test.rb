class Test < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :category

  has_many :test_users, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_many :users, through: :test_users

  accepts_nested_attributes_for :questions, allow_destroy: true

  validates :title, presence: true,
                    uniqueness: { scope: :level,
                                  message: '%<attribute>s - %<value>s not unique' }

  validates :level,
            numericality: { greater_than_or_equal_to: 0, only_integer: true,
                            message: '%<value>s seems wrong' }

  scope :single_level, ->(arg) { where(level: arg) }

  scope :plain, -> { single_level(0..1) }
  scope :middle, -> { single_level(2..3) }
  scope :difficult, -> { single_level(4..Float::INFINITY) }

  scope :tests_by_category, ->(arg) { joins(:category)
                                     .where(categories: { title: arg }).order(title: :desc) }

  def self.by_category(category)
    tests_by_category(category).pluck(:title)
  end 
end

