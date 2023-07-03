class AbstractRuleSpecification
  def initialize(value:, test_passage:)
    @user = test_passage.user
    @test = test_passage.test
    @test_passage = test_passage
    @value = value
  end

  def satisfies?
    raise "#{__method__} undifinef for #{self.class}"
  end
end
