class CreateBadges < ActiveRecord::Migration[6.1]
  def change
    create_table :badges do |t|
      t.string :rule, null: false
      t.string :image_url, null: false
      t.string :rule_value, null: false
      t.timestamps
    end
  end
end
