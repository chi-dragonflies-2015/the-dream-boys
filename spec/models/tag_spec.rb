require 'rails_helper'

RSpec.describe Tag, :type => :model do
  describe "validations" do
    it "should not save without a description" do
      @tag = Tag.new
      expect(@tag.save).to eq(false)
    end
  end
end
