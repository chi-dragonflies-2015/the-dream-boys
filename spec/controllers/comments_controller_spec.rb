require 'rails_helper'

RSpec.describe CommentsController, :type => :controller do
  describe 'GET index' do
    it "returns a 302 status code" do
      get :index, game_id: 1
      expect(response.status).to eq(302)
    end
  end

  describe 'GET new' do
    it "returns a 200 status code" do
      get :new, game_id: 1
      expect(response.status).to eq(200)
    end
  end

   describe 'POST create when logged out' do
    it "returns a 200 status code if not logged in" do
      post :create, game_id: 1, :comment => {game_id: 1, commenter_id: 1, content: "Test"}
      expect(response.status).to eq(200)
    end
  end

   describe 'POST create when logged in' do
    it "returns a 302 status code if logged in" do
      session[:user_id] = 1
      post :create, game_id: 1, :comment => {game_id: 1, commenter_id: 1, content: "Test"}
      expect(response.status).to eq(302)
    end
  end

  describe 'GET show' do
    it "returns a 302 status code" do
      get :show, game_id: 1, id: 1
      expect(response.status).to eq(302)
    end
  end

 ######################################

  #EDIT UPDATE AND DESTROY HERE

 ######################################
end

# rake db:test:prepare before each time you test.
