class AddConstraints < ActiveRecord::Migration[7.0]
  def change
    change_column_null(:challenges, :user_id, false)
    add_foreign_key :challenges, :users
    change_column_null(:activities, :user_id, false)
    add_foreign_key :activities, :users
  end
end
