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
    user1 = User.create(username: "user1", first_name: "first", last_name: "last", bio: "bio", password: "password")
    user1 = User.create(username: "user1", first_name: "first", last_name: "last", bio: "bio", password: "password")
    user1 = User.create(username: "user1", first_name: "first", last_name: "last", bio: "bio", password: "password")
  end

end
