class AddUserIdToResources < ActiveRecord::Migration[7.0]
  def change
    add_reference :challenges, :user
    add_reference :activities, :user
  end
end
