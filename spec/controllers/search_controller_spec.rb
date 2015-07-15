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

describe '#search_users' do
  before (:each) do
    User.destroy_all
    @user1 = User.create(username: "1", first_name: "one", last_name: "last", bio: "bio", password: "password")
    @user2 = User.create(username: "2", first_name: "two", last_name: "last", bio: "bio", password: "password")
    @user3 = User.create(username: "3", first_name: "three", last_name: "last", bio: "bio", password: "password")
  end

  after (:each) do
    User.destroy_all
  end

  it "correctly finds users by username" do
    expect(ApplicationController.new.search_users("1")).to eq([@user1])
  end

  it "correctly finds users by first name" do
    expect(ApplicationController.new.search_users("e")).to eq([@user1, @user3])
  end

  it "correctly finds users by last name" do
    expect(ApplicationController.new.search_users("last")).to eq([@user1, @user2, @user3])
  end
end
