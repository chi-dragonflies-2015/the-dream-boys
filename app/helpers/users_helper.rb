module UsersHelper
  def search_users(string)
    usernamed = User.where("users.username LIKE :username", {:username: "#{string}"})
  end
end
