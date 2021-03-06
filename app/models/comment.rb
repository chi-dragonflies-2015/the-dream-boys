class Comment < ActiveRecord::Base
  validates :content, presence: true



  belongs_to :commenter, class_name: "User"
  belongs_to :game
  has_many :votes, as: :votable
  has_many :voters, through: :votes, source: :user

end
