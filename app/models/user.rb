class User < ActiveRecord::Base
  has_many :frienderships, class_name: "Friendship", foreign_key: "friender_id"
  has_many :friendeeships, class_name: "Friendship", foreign_key: "friendee_id"
  has_many :frienders, through: :friendeeships, source: :friender
  has_many :friendees, through: :frienderships, source: :friendee

  has_secure_password

  validates :username, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :bio, presence: true


  def friends
    output = []
    output.concat(frienders)
    output.concat(friendees)
    output
  end


end
