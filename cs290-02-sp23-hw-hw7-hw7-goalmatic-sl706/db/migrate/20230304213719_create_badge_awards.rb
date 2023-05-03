class CreateBadgeAwards < ActiveRecord::Migration[7.0]
  def change
    create_table :badge_awards do |t|
      t.references :badge, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :challenge

      t.timestamps
    end
  end
end
