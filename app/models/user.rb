class User < ApplicationRecord
  has_many :user_workouts
  has_secure_password
end
