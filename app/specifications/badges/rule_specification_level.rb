module Badges
  class RuleSpecificationLevel < AbstractRuleSpecification
    def satisfied?
      return false unless @test_passage.successful? && UserBadge.badge_blank?(@user, @value)

      value_int = @value.to_i
      Test.single_level(value_int).count == @user.tests_success.where(test: {level: value_int}).uniq.count
    end
  end
end
