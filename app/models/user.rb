class User < ActiveRecord::Base
  has_many :friendships
  # has_many :frienders, through: :friendships
end
