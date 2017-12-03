class Team < ApplicationRecord
  belongs_to :league
  has_many :fixture
  validates :name, :league, presence: true
end
