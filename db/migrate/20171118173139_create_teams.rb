class CreateTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :teams do |t|
      t.belongs_to :league, foreign_key: true
      t.string :name, null: false
      t.string :coach, null: false

      t.integer :MP, default: 0
      t.integer :W, default: 0
      t.integer :D, default: 0
      t.integer :L, default: 0
      t.integer :Pts, default: 0

      t.timestamps
    end
  end
end
