class Games < ActiveRecord::Base
  has_many :comments
  has_many :games_tags
  has_many :tags, through: :games_tags
  has_many :ownerships
  has_many :owners, through: :ownerships, source: :owner_id
  has_many :votes, as: :voteable
  has_many :votes, though: :votes, source: :user

  validates :title, {presence: true, uniqueness: true}
  validates :description, {presence: true}
  validates :min_players, {presence: true}
  validates :max_players, {presence: true}
  validates :min_age, {presence: true}
  validates :min_time, {presence: true}
  validates :max_time, {presence: true}
  validates :min_player_less_than_max
  validates :min_time_less_than_max

  private

  def min_player_less_than_max
    if self.min_players > self.max_players
      errors.add(:min_players, "should be less than max players.")
    end
  end

  def min_time_less_than_max
    if self.min_time > self.max_time
      errors.add(:min_time, "should be less than max time.")
  end


end
