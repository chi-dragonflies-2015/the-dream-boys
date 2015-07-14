require "rails_helper"

describe User do
  user = User.new(username: "pmac", first_name: "Pete", last_name: "Mac", password: "password", bio: "whatever")
  it "passes" do
    expect(1).to eq(1)
  end
end
