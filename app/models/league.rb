class League < ApplicationRecord
	has_many :team, dependent: :destroy
	has_many :fixture, dependent: :destroy
	validates :title, presence: true

	belongs_to :user
end
