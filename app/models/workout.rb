class Workout < ApplicationRecord
  has_many :users
  belongs_to :swim
end
