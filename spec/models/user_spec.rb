require "rails_helper"

describe User do
  describe "validations" do

    before (:each) do
      @user = User.new(username: "pmac", first_name: "Pete", last_name: "Mac", password: "password", bio: "whatever")
    end

    it "is valid with a username, first_name, last_name, password, and bio" do
      expect(@user.save).to eq(true)
    end

    it "is invalid without a username" do
      @user.username = nil
      expect(@user.save).to eq(false)
    end

    it "must have a unique username" do
      @user.save
      @new_user = User.new(username: "pmac", first_name: "Pete2", last_name: "Mac2", password: "password2", bio: "whatever2")
      expect(@new_user.save).to eq(false)
    end

    it "is invalid without a first_name" do
      @user.first_name = nil
      expect(@user.save).to eq(false)
    end

    it "is invalid without a last_name" do
      @user.last_name = nil
      expect(@user.save).to eq(false)
    end

    # it "is invalid without a bio" do
    #   @user.bio = nil
    #   expect(@user.save).to eq(false)
    # end

    it "is invalid without a password" do
      @user.password = nil
      expect(@user.save).to eq(false)
    end
  end

  describe "friends associations" do

    before (:each) do
      @user_a = User.create(username: "userA", first_name: "first", last_name: "last", bio: "bio", password: "password")
      @user_b = User.create(username: "userB", first_name: "first", last_name: "last", bio: "bio", password: "password")
      @user_c = User.create(username: "userC", first_name: "first", last_name: "last", bio: "bio", password: "password")
    end

    it "knows its frienders" do
      @user_a.frienders << @user_b
      expect(@user_a.frienders.first.username).to eq("userB")
    end

    it "knows its friendees" do
      @user_a.friendees << @user_b
      expect(@user_a.friendees.first.username).to eq("userB")
    end

    it "knows its friends from both frienders and friendees" do
      @user_b.frienders << @user_a
      @user_b.friendees << @user_c
      expect(@user_b.friends.map{|f| f.username}).to eq(["userA", "userC"])
    end
  end

  describe "image method" do

    before (:each) do
      @user = User.new(username: "pmac", first_name: "Pete", last_name: "Mac", password: "password", bio: "whatever")
    end

    it "uses the default image if none is provided" do
      expect(@user.image).to eq("default pic url")
    end

    it "uses the provided image if there is one" do
      @user.image_url = "new image url"
      expect(@user.image).to eq("new image url")
    end
  end

end
