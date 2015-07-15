require 'rails_helper'



describe '#search_games' do
  before (:each) do
    Game.destroy_all
    @mono = Game.create({title: "Monopoly",
                    image_url: "http://placehold.it/200x100",
                    description: "Literally no one has ever finished this game",
                    min_players: 2,
                    max_players: 5,
                    min_age: 10,
                    min_time: 10000,
                    max_time: 25000} )
    @risk = Game.create({title: "Riskno",
                    image_url: "http://placehold.it/200x100",
                    description: "This one either",
                    min_players: 2,
                    max_players: 8,
                    min_age: 10,
                    min_time: 10000,
                    max_time: 25000} )
    @bs = Game.create!({title: "Battleship",
                    image_url: "http://placehold.it/200x100",
                    description: "The original naval game",
                    min_players: 2,
                    max_players: 2,
                    min_age: 10,
                    min_time: 10,
                    max_time: 25} )
    shooter = Tag.create!(description: "Shootem Up")
    strategy = Tag.create!(description: "Strategic")
    @risk.tags << shooter
    @risk.tags << strategy
    @mono.tags << strategy
  end

  after (:each) do
    Game.destroy_all
  end

  it 'correctly finds games by title' do
    expect(ApplicationController.new.search_games("no")).to eq([@mono, @risk])
    expect(ApplicationController.new.search_games("ba")).to eq([@bs])
  end

  it 'correctly finds games by tag' do
    expect(ApplicationController.new.search_games("str")).to eq([@mono, @risk])
    expect(ApplicationController.new.search_games("tem")).to eq([@risk])
  end
end

