game = Game.create({title: "Battleship",
                  image_url: "http://placehold.it/200x100",
                  description: "The original naval game",
                  min_players: 2,
                  max_players: 2,
                  min_age: 10,
                  min_time: 10,
                  max_time: 25} )

user = User.create({username: 'temp',
                first_name: 'Bill',
                last_name: 'Cat',
                password_digest: 'password',
                bio: "Aaack"})


