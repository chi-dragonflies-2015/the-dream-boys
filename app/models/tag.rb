class Tag < ActiveRecord::Base
  has_many :games_tags
  has_many :games, through: :games_tags

  validates :description, {presence: true}
end
