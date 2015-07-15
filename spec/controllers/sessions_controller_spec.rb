require 'rails_helper'

RSpec.describe SessionsController, :type => :controller do

  before (:each) do
    User.destroy_all
    @user = User.create(username: "pmac", first_name: "Pete", last_name: "Mac", password: "password", bio: "whatever")
    session[:user_id] = nil
  end

  after (:each) do
    User.destroy_all
    session[:user_id] = nil
  end

  describe 'POST create' do
    it 'logs a user in and redirects if username and password are valid' do
      expect(session[:user_id]).to eq(nil)
      post :create, {session: {username: "pmac", password: "password"}}
      expect(session[:user_id]).to eq(@user.id)
      expect(response.status).to eq(302)
    end

    it 'does not log a user in if username and password are not valid' do
      expect(session[:user_id]).to eq(nil)
      post :create, {session: {username: "pmac", password: "passwasdfgord"}}
      expect(session[:user_id]).to eq(nil)
      expect(response.status).to eq(200)
    end
  end

end
