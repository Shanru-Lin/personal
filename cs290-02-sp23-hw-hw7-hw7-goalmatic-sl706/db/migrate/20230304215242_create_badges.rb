class CreateBadges < ActiveRecord::Migration[7.0]
  def change
    create_table :badges do |t|
      t.string :name, null: false
      t.string :description
      t.references :category
      t.integer :count
      t.string :goal_type

      t.timestamps
    end
  end
end
