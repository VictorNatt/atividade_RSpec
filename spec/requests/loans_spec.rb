require 'rails_helper'

RSpec.describe "Loans API", type: :request do
  let(:user) { create(:user) }
  let(:book) { create(:book) }

  describe "POST /books/:book_id/loans" do
    it "creates a loan" do
      sign_in user
      expect {
        post book_loans_path(book)
      }.to change(Loan, :count).by(1)
    end
  end

  describe "DELETE /loans/:id" do
    let!(:loan) { create(:loan, book: book, user: user) }

    it "deletes the loan" do
      sign_in user
      expect {
        delete loan_path(loan)
      }.to change(Loan, :count).by(-1)
    end
  end
end