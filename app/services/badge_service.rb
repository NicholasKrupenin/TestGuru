class BadgeService
  def initialize(test_passage)
    @user = test_passage.user
    @test = test_passage.test
    @test_passage = test_passage
  end

  def add_badge
    bage_grab.each do |badge|
      @user.badges[badge] = @user.badges[badge].to_i + 1
    end
    @user.save
  end

  private

  def bage_grab
    Badge::BADGE_RULE.select { |badge| send("#{badge}?") }
  end

  def first?
    @user.tests.where(id: @test.id).count == 1 && @test_passage.successful?
  end

  def level?
    Test.single_level(@test.level).count == @user.tests.where(level: @test.level).uniq.count
  end

  def category?
    Test.category_for_badge(@test.category.id).count == @user.tests.where(category: @test.category.id).uniq.count
  end
end
