module Badges
  class RuleSpecificationFirst < AbstractRuleSpecification
    def satisfied?
      return false unless @test_passage.successful?

      @user.tests.where(id: @test).count == 1
    end
  end
end
