class Category < ApplicationRecord
  default_scope  { order(:title) }

  has_many :tests, dependent: :destroy

  validates :title, presence: true

  scope :find_category, ->(category) { where(title: category) }
end
