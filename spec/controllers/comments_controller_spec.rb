require 'rails_helper'

RSpec.describe CommentsController, :type => :controller do
  describe 'GET index' do
    it "returns a 302 status code" do
      # comment = Game.find_by(id: 1).comments.new
      get :index, game_id: 1
      expect(response.status).to eq(302)
    end
  end

  describe 'GET show' do
    it "returns a 302 status code" do
      # comment = Game.find_by(id: 1).comments.new
      get :show, game_id: 1, id: 1
      expect(response.status).to eq(302)
    end
  end

end

# rake db:test:prepare before each time you test.
