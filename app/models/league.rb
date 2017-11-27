class League < ApplicationRecord
	has_many :team, dependent: :destroy
end
