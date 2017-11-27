class CreateTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :teams do |t|
      t.belongs_to :league, foreign_key: true
      t.string :name, null: false
      t.string :coach, null: false

      t.integer :MP
      t.integer :W
      t.integer :D
      t.integer :L
      t.integer :Pts

      t.timestamps
    end
  end
end
