

bs = Game.create!({title: "Battleship",
                  image_url: "http://www.geeksofdoom.com/GoD/img/2012/05/2012-05-17-battleship_game.jpg",
                  description: "The original naval game",
                  min_players: 2,
                  max_players: 2,
                  min_age: 10,
                  min_time: 10,
                  max_time: 25} )


user = User.create!({first_name: "Bob",
                    last_name: "Burger",
                    username: "bob23",
                    password: "test",
                    bio: "I am a fat dude with a bad attitude.",
                    image_url: "http://blog.nuraypictures.com/wp-content/uploads/2013/09/BobBelcher1.jpg",
                    admin: false
                    })

 # t.string :username#, null: false
 #      t.string :first_name#, null: false
 #      t.string :last_name#, null: false
 #      t.string :password_digest#, null: false
 #      t.string :bio
 #      t.boolean :admin, default: false


bs.comments.create!(content: "Test content1", commenter_id: user.id)
bs.comments.create!(content: "Test content2", commenter_id: user.id)
bs.comments.create!(content: "Test content3", commenter_id: user.id)
bs.comments.create!(content: "Test content4", commenter_id: user.id)
bs.comments.create!(content: "Test content5", commenter_id: user.id)
bs.comments.create!(content: "Test content6", commenter_id: user.id)
bs.comments.create!(content: "Test content7", commenter_id: user.id)
bs.comments.create!(content: "Test content8", commenter_id: user.id)
bs.comments.create!(content: "Test content9", commenter_id: user.id)
ten = bs.comments.create!(content: "Test content10", commenter_id: user.id)


mono = Game.create({title: "Monopoly",
                  image_url: "http://nordoniahillsbranch.akronlibrary.org/files/2013/01/monopolyman.jpg",
                  description: "Literally no one has ever finished this game",
                  min_players: 2,
                  max_players: 5,
                  min_age: 10,
                  min_time: 10000,
                  max_time: 25000} )

risk = Game.create({title: "Risk",
                  image_url: "https://gamesweplayed.files.wordpress.com/2010/04/the-classic-risk-board-game.png",
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


up = Vote.create!(value: 1, voter_id: 1)#user_b.id)
down = Vote.create!(value: -1, voter_id: 1)#user_d.id)


user_b.games << bs

user_b.games << mono
user_b.games << risk


shooter = Tag.create!(description: "Shootem Up")
strategy = Tag.create!(description: "Strategic")


risk.tags << shooter
risk.tags << strategy
mono.tags << strategy
mono.votes << up
risk.votes << up
ten.votes << down
