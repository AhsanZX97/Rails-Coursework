class Fixture < ApplicationRecord
  belongs_to :league
  belongs_to :home, :class_name => 'Team'
  belongs_to :away, :class_name => 'Team'
  validates :homegoals, :awaygoals, presence: true, :numericality => { :greater_than_or_equal_to => 0 }

end
