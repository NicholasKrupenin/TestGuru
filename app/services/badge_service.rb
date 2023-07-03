class BadgeService
  RULES = {
    category: Badges::RuleSpecificationCategory,
    level: Badges::RuleSpecificationLevel,
    first: Badges::RuleSpecificationFirst
  }.freeze

  def initialize(test_passage)
    @user = test_passage.user
    @test_passage = test_passage
  end

  def add_badge
    Badge.find_each do |badge|
      rule = RULES[badge.rule.to_sym].new(value: badge.rule_value, test_passage: @test_passage)

      @user.badges.push(badge) if rule.satisfied?
    end
  end
end
