game = Game.create!({title: "Rando12",
                  image_url: "http://placehold.it/200x100",
                  description: "The original naval game",
                  min_players: 2,
                  max_players: 2,
                  min_age: 10,
                  min_time: 10,
                  max_time: 25} )

user = User.create!({first_name: "Bob",
                    last_name: "Burger",
                    username: "bob2",
                    password: "test",
                    bio: "I am a fat dude with a bad attitude.",
                    admin: false
                    })

 # t.string :username#, null: false
 #      t.string :first_name#, null: false
 #      t.string :last_name#, null: false
 #      t.string :password_digest#, null: false
 #      t.string :bio
 #      t.boolean :admin, default: false

game.comments.create!(content: "Test content1", commenter_id: user.id)
game.comments.create!(content: "Test content2", commenter_id: user.id)
game.comments.create!(content: "Test content3", commenter_id: user.id)
game.comments.create!(content: "Test content4", commenter_id: user.id)
game.comments.create!(content: "Test content5", commenter_id: user.id)
game.comments.create!(content: "Test content6", commenter_id: user.id)
game.comments.create!(content: "Test content7", commenter_id: user.id)
game.comments.create!(content: "Test content8", commenter_id: user.id)
game.comments.create!(content: "Test content9", commenter_id: user.id)
game.comments.create!(content: "Test content10", commenter_id: user.id)


