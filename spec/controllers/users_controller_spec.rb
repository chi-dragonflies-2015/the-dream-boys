require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

  before (:each) do
    User.destroy_all
    @user = User.create(username: "pmac", first_name: "Pete", last_name: "Mac", password: "password", bio: "whatever")
  end

  after (:each) do
    User.destroy_all
  end

  describe "GET show" do
    it "finds the correct user" do
      get :show, id: @user.id
      expect(response.status).to eq(200)
    end
  end

  describe "POST create" do
    it "creates a user and redirects if params are valid" do
      expect{post :create, user: {username: "pmac1",
                             first_name: "Pete1",
                             last_name: "Mac1",
                             password: "password1",
                             bio: "whatever1"}}.to change{User.count}.by(1)

      expect(response.status).to eq(302)
    end

    it "does not create a user if params are not valid" do
      expect{post :create, user: {username: nil,
                             first_name: "Pete",
                             last_name: "Mac",
                             password: "password",
                             bio: "whatever"}}.to change{User.count}.by(0)

      expect(response.status).to eq(200)
    end
  end
end
