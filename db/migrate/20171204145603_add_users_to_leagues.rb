class AddUsersToLeagues < ActiveRecord::Migration[5.0]
	def up
		add_reference :leagues, :user, index: true
		League.reset_column_information
		user = User.first
		League.all.each do |league|
		league.user_id = user.id
		league.save!
		end
		change_column_null :leagues, :user_id, false
		add_foreign_key :leagues, :users
	end

	def down
		remove_foreign_key :leagues, :users
		remove_reference :leagues, :user, index: true
	end
end
