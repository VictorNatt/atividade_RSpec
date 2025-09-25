require 'rails_helper'

RSpec.describe Book, type: :model do
  it "has a valid factory" do
    expect(build(:book)).to be_valid
  end

  it "requires title" do
    expect(build(:book, title: nil)).not_to be_valid
  end

  it "requires author" do
    expect(build(:book, author: nil)).not_to be_valid
  end
end