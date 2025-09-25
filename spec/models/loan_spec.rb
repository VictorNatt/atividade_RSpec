require 'rails_helper'

RSpec.describe Loan, type: :model do
  it "has a valid factory" do
    expect(build(:loan)).to be_valid
  end

  it "requires user" do
    expect(build(:loan, user: nil)).not_to be_valid
  end

  it "requires book" do
    expect(build(:loan, book: nil)).not_to be_valid
  end
end