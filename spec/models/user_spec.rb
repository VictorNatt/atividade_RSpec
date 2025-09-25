require 'rails_helper'

RSpec.describe User, type: :model do
  it "has a valid factory" do
    expect(build(:user)).to be_valid
  end

  it "requires email" do
    expect(build(:user, email: nil)).not_to be_valid
  end

  it "requires unique email" do
    create(:user, email: "test@example.com")
    expect(build(:user, email: "test@example.com")).not_to be_valid
  end

  it "requires password" do
    expect(build(:user, password: nil)).not_to be_valid
  end
end
