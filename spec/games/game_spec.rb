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

      it "should be invalid witout a name" do
        @game.title = ""
        expect(@game.save).to eq(false)
    end

  end
end
