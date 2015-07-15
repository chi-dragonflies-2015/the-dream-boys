class Vote < ActiveRecord::Base
  belongs_to :user, foreign_key: :voter_id
  belongs_to :votable, polymorphic: true

  validates :value, {presence: true}
  validates :voter_id, {presence: true}
  validate :value_has_only_two_possibilities

  def self.allowed_to_vote(current_user, current_votable)
    !current_votable.voters.include?(current_user)
  end

  def self.total(item)
    sum = 0
    item.votes.each {|vote| sum += vote.value}
    sum
  end

  private

  def value_has_only_two_possibilities
    puts "********** #{self.value.class}"
    if (value != 1) || (value != -1)
      errors.add(:value, "can't be anything but 1 or -1")
    end
  end
end
