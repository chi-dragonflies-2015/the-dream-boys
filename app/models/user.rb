class User < ActiveRecord::Base
  has_many :frienderships, class_name: "Friendship", foreign_key: "friender_id"
  has_many :friendeeships, class_name: "Friendship", foreign_key: "friendee_id"
  has_many :frienders, through: :friendeeships, source: :friender
  has_many :friendees, through: :frienderships, source: :friendee
  has_many :comments, foreign_key: "commenter_id"
  has_many :votes, foreign_key: "voter_id"
  has_many :ownerships, foreign_key: "owner_id"
  has_many :games, through: :ownerships

  has_secure_password

  validates :username, {presence: true, uniqueness: true}
  validates :first_name, presence: true
  validates :last_name, presence: true

  def friends
    output = []
    output.concat(frienders)
    output.concat(friendees)
    output
  end

  def image
    if self.image_url
      self.image_url
    else
      "default pic url"
    end
  end


end
