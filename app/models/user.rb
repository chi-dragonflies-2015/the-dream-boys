class User < ActiveRecord::Base
  has_many :frienderships, class_name: "Friendship", foreign_key: "friender_id"
  has_many :friendeeships, class_name: "Friendship", foreign_key: "friendee_id"
  has_many :frienders, through: :friendeeships, source: :friender
  has_many :friendees, through: :frienderships, source: :friendee
end
