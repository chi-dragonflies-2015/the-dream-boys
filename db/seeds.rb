# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

game = Game.create({title: "Battleship",
                  image_url: "http://placehold.it/200x100",
                  description: "The original naval game",
                  min_players: 2,
                  max_players: 2,
                  min_age: 10,
                  min_time: 10,
                  max_time: 25} )
