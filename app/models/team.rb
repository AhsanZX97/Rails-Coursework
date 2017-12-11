class Team < ApplicationRecord
  belongs_to :league
  has_many :fixture, dependent: :destroy
  validates :name, :league, presence: true
end
