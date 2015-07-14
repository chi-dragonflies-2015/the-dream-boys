require 'rails_helper'

RSpec.describe Vote, :type => :model do
  describe "validations" do


    it "should not save without a value" do
      @vote = Vote.new(voter_id: 2)
      expect(@vote.save).to eq(false)
    end

    it "should not save without a voter_id" do
      @vote = Vote.new(value: 1)
      expect(@vote.save).to eq(false)
    end

    it "can't have an incorrect value" do
      @vote = Vote.new(value: 0, voter_id: 1)
      expect(@vote.save).to eq(false)
    end
  end
end
