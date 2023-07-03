module Badges
  class RuleSpecificationCategory < AbstractRuleSpecification
    def satisfied?
      return false unless @test_passage.successful? && UserBadge.badge_blank?(@user, @value)

      category = Category.find_category(@value)
      test_category = Test.all.where(category_id: category).count
      test_success  = @user.tests_success.where(test: { category_id: category }).uniq.count
      test_category == test_success
    end
  end
end
