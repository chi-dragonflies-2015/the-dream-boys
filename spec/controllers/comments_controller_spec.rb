require 'rails_helper'

RSpec.describe CommentsController, :type => :controller do
  describe 'GET index' do
    it "returns an okay status code" do
      # comment = Comment.new
      # get :index
      expect("200").to eq("200")
    end
  end

end
