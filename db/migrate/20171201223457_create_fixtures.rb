class CreateFixtures < ActiveRecord::Migration[5.0]
  def change
    create_table :fixtures do |t|
      t.belongs_to :league, index: true, foreign_key: true, null: false
      t.belongs_to :home, index: true, foreign_key: true, null: false
      t.belongs_to :away, index: true, foreign_key: true, null: false
      t.integer :homegoals, null: false, default: 0
      t.integer :awaygoals, null: false, default: 0

      t.timestamps
    end
  end
end
