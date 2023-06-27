class UserBadge < ApplicationRecord
  belongs_to :user
  belongs_to :badge

  scope :count_badge, ->(user, badge) { where(user_id: user.id, badge_id: badge.id).count }

  def self.count_badge_by_rule(user, rule_value)
    where(user_id: user, badge_id: Badge.find_by(rule_value: rule_value)).count
  end
end
