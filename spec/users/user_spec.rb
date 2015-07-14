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

    it "is invalid without a first_name" do
      @user.first_name = nil
      expect(@user.save).to eq(false)
    end

    it "is invalid without a last_name" do
      @user.last_name = nil
      expect(@user.save).to eq(false)
    end

    it "is invalid without a bio" do
      @user.bio = nil
      expect(@user.save).to eq(false)
    end

    it "is invalid without a password" do
      @user.password = nil
      expect(@user.save).to eq(false)
    end
  end

  describe "friends associations" do

    before (:each) do
      @user1 = User.create(username: "user1", first_name: "first", last_name: "last", bio: "bio", password: "password")
      @user2 = User.create(username: "user2", first_name: "first", last_name: "last", bio: "bio", password: "password")
      @user3 = User.create(username: "user3", first_name: "first", last_name: "last", bio: "bio", password: "password")
    end

    it "knows its frienders" do
      @user1.frienders << @user2
      expect(@user1.frienders.first.username).to eq("user2")
    end

    it "knows its friendees" do
      @user1.friendees << @user2
      expect(@user1.friendees.first.username).to eq("user2")
    end

    it "knows its friends from both frienders and friendees" do
      @user2.friendees << @user3
      @user2.frienders << @user1
      expect(@user2.friends.map{|f| f.username}).to eq(["user1", "user3"])
    end

  end

end
