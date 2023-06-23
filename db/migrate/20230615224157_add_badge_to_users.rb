class AddBadgeToUsers < ActiveRecord::Migration[6.1]
  def self.up
    enable_extension "hstore"
    add_column :users, :badges, :hstore, default: {}
  end

  def self.down
    remove_column :users, :badges
    disable_extension "hstore"
  end
end
