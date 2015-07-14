require 'rails_helper'

RSpec.describe CommentsController, :type => :controller do
  describe 'GET index' do
    it "returns an okay status code" do
      comment = Comments.new
      get :index
      expect(response).to eq(200)
    end
  end

end
