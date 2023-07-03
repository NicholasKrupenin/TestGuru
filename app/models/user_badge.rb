class UserBadge < ApplicationRecord
  belongs_to :user
  belongs_to :badge

  scope :count_badge, ->(user, badge) { where(user_id: user, badge_id: badge).count }

  def self.badge_blank?(user, rule_value)
    user.badges.where(rule_value: rule_value).blank?
  end
end
