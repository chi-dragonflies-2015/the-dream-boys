require 'rails_helper'

RSpec.describe Vote, :type => :model do
  describe "validations" do


    it "should not save without a value" do
      @vote = Vote.new(voter_id: 2)
      expect(@vote.save).to eq(false)
    end

    it "should not save without a voter_id" do
      @vote = Vote.new(value: 1)
      expect(@vote.save).to eq(false)
    end

    it "can't have an incorrect value" do
      @vote = Vote.new(value: 0, voter_id: 1)
      expect(@vote.save).to eq(false)
    end
  end
  describe "allowed to vote" do
    it "will let you vote if you haven't voted already" do
      @game = Game.new({title: "Battleship",
                          image_url: "http://placehold.it/200x100",
                          description: "The original naval game",
                          min_players: 2,
                          max_players: 2,
                          min_age: 10,
                          min_time: 10,
                          max_time: 25} )
      @user = User.new(username: "pmac", first_name: "Pete", last_name: "Mac", password: "password", bio: "whatever")
      expect(Vote.allowed_to_vote(@user, @game)).to eq(true)
    end
  end

  describe "total votes" do
    it "adds up the votes for a votable object" do
      @game = Game.new({title: "Battleship",
                          image_url: "http://placehold.it/200x100",
                          description: "The original naval game",
                          min_players: 2,
                          max_players: 2,
                          min_age: 10,
                          min_time: 10,
                          max_time: 25} )
      @vote = Vote.new(value: -1, voter_id: 2)
      @game.votes << @vote
      expect(Vote.total(@game)).to eq(-1)
    end
  end
end
