class Badge < ApplicationRecord
  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges

  validates :rule, presence: true, uniqueness: { scope: :rule, message: "Name already exists" }
  validates :image_url, presence: true,
                            uniqueness: { scope: :image_url, message: "Image_url already exists" },
                            format: { with: URI::DEFAULT_PARSER.make_regexp(%w[http https]),
                                                                message: "Image_url is invalid" }
  validates :rule_value, presence: true
end
