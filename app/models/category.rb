class Category < ApplicationRecord
  default_scope  { order(:title) }

  has_many :tests, dependent: :destroy

  validates :title, presence: true
end
