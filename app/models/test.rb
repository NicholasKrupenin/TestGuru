class Test < ApplicationRecord

  def self.tests_by_category(title_category)
    joins('JOIN categories ON tests.category_id = categories.id')
      .where(categories: { title: title_category })
      .order(title: :desc)
      .pluck(:title)
  end
end
