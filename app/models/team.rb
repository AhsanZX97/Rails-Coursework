class Team < ApplicationRecord
  belongs_to :league
  validates :name, :league, presence: true
end
