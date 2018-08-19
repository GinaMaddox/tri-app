class User < ApplicationRecord
  has_many :user_plans
  has_secure_password
end
