bs = Game.create({title: "Battleship",
                  image_url: "http://placehold.it/200x100",
                  description: "The original naval game",
                  min_players: 2,
                  max_players: 2,
                  min_age: 10,
                  min_time: 10,
                  max_time: 25} )

mono = Game.create({title: "Monopoly",
                  image_url: "http://placehold.it/200x100",
                  description: "Literally no one has ever finished this game",
                  min_players: 2,
                  max_players: 5,
                  min_age: 10,
                  min_time: 10000,
                  max_time: 25000} )

risk = Game.create({title: "Risk",
                  image_url: "http://placehold.it/200x100",
                  description: "This one either",
                  min_players: 2,
                  max_players: 8,
                  min_age: 10,
                  min_time: 10000,
                  max_time: 25000} )

user_a = User.create(username: "userA", first_name: "first", last_name: "last", bio: "bio", password: "password")
user_b = User.create(username: "userB", first_name: "first", last_name: "last", bio: "bio", password: "password")
user_c = User.create(username: "userC", first_name: "first", last_name: "last", bio: "bio", password: "password")
user_d = User.create(username: "userD", first_name: "first", last_name: "last", bio: "bio", password: "password")

user_a.friendees << user_b
user_b.friendees << user_c
user_c.friendees << user_d



