class Workout < ApplicationRecord
  belongs_to :plan
  belongs_to :swim
end
