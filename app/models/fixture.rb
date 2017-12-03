class Fixture < ApplicationRecord
  belongs_to :league
  belongs_to :home, :class_name => 'Team'
  belongs_to :away, :class_name => 'Team'
  validates :homegoals, :awaygoals, presence: true
end
