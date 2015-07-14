require 'rails_helper'
require 'spec_helper'

describe Game do

  describe "validations" do

    before (:each) do
      @game = Game.new({title: "Battleship",
                          image_url: "http://placehold.it/200x100",
                          description: "The original naval game",
                          min_players: 2,
                          max_players: 2,
                          min_age: 10,
                          min_time: 10,
                          max_time: 25} )
    end

    it "should be invalid without a title" do
      @game.title = ""
      expect(@game.save).to eq(false)
  end

  it "should be invalid without a description" do
      @game.description = ""
      expect(@game.save).to eq(false)
  end

   it "should be invalid without a min_age" do
      @game.min_age = ""
      expect(@game.save).to eq(false)
  end


   it "should be invalid if min_players are larger than max_players" do
      @game.max_players = 1
      expect(@game.save).to eq(false)
  end


   it "should be invalid if min_time is greater than max_time" do
      @game.max_time = 9
      expect(@game.save).to eq(false)
  end



  end
end
