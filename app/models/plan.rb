class Plan < ApplicationRecord
  has_many :user_plans
  has_many :workouts
end
