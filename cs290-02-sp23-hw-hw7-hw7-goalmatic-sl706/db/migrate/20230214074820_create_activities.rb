class CreateActivities < ActiveRecord::Migration[7.0]
  def change
    create_table :activities do |t|
      t.string :note
      t.integer :amount, default: 0
      t.references :challenge, null: false, foreign_key: true

      t.timestamps
    end
  end
end