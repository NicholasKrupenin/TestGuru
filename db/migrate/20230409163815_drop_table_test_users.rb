class DropTableTestUsers < ActiveRecord::Migration[6.1]
  def change
    drop_table :test_users, if_exists: true
  end
end
