class Badge < ApplicationRecord

  validates :name, presence: true, uniqueness: { scope: :name, message: 'Name already exists' }
  validates :image_url, presence: true,
                            uniqueness: { scope: :image_url, message: 'Image_url already exists' },
                            format: { with: URI::DEFAULT_PARSER.make_regexp(%w[http https]),
                                                                message: 'Image_url is invalid' }

  BADGE_RULE = %w[first level category].freeze

  def self.get_badge(badge_name)
    Badge.find_by(name: badge_name)
  end

  def self.badge_return_hash
    Badge.all.map { |badge| [badge.name, badge.image_url] }.to_h
  end
end
