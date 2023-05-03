class AddAmountToActivities < ActiveRecord::Migration[7.0]
  def change
    add_column :activities, :amount, :integer, default: 0
  end
end
