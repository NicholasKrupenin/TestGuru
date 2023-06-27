class BadgeService
  def initialize(test_passage)
    @user = test_passage.user
    @test = test_passage.test
    @test_passage = test_passage
  end

  def add_badge
    return unless badge_grab.present?

    badge_grab.each do |badge|
      @user.badges.push(badge)
    end
  end

  private

  def badge_grab
    Badge.all.select { |badge| send("#{badge.rule}?", badge.rule_value) }
  end

  def first?(rule_value)
    return if rule_value == false

    @user.tests.where(id: @test).count == 1
  end

  def level?(rule_value)
    return unless badge_release?(rule_value)

    Test.single_level(rule_value).count == @user.success_tests.where(level: rule_value).uniq.count
  end

  def category?(rule_value)
    return unless badge_release?(rule_value)

    category = Category.find_category(rule_value)
    test_category = Test.category_for_badge(category).count
    test_success  = @user.success_tests.where(category_id: category).uniq.count
    test_category == test_success
  end

  def badge_release?(rule_value)
    UserBadge.count_badge_by_rule(@user, rule_value).zero?
  end
end
