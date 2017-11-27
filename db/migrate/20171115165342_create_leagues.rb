class CreateLeagues < ActiveRecord::Migration[5.0]
  def change
    create_table :leagues do |t|
    	t.string :title, null: false
    	t.integer :teams, null: false, default: 5

      t.timestamps
    end
  end
end
