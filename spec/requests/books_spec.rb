require 'rails_helper'

RSpec.describe "Books API", type: :request do
  let(:admin) { create(:user, role: :admin) }
  let(:user) { create(:user) }
  let!(:book) { create(:book) }

  describe "GET /books" do
    it "returns books" do
      sign_in user
      get books_path
      expect(response).to have_http_status(:ok)
      expect(response.body).to include(book.title)
    end
  end

  describe "GET /books/:id" do
    it "returns book details" do
      sign_in user
      get book_path(book)
      expect(response).to have_http_status(:ok)
      expect(response.body).to include(book.title)
    end
  end

  describe "POST /books" do
    it "creates book as admin" do
      sign_in admin
      expect {
        post books_path, params: { book: attributes_for(:book) }
      }.to change(Book, :count).by(1)
    end

    it "does not create book as normal user" do
      sign_in user
      expect {
        post books_path, params: { book: attributes_for(:book) }
      }.not_to change(Book, :count)
    end
  end

  describe "PATCH /books/:id" do
    it "updates book as admin" do
      sign_in admin
      patch book_path(book), params: { book: { title: "Novo Título" } }
      expect(book.reload.title).to eq("Novo Título")
    end
  end

  describe "DELETE /books/:id" do
    it "deletes book as admin" do
      sign_in admin
      book_to_delete = create(:book)
      expect {
        delete book_path(book_to_delete)
      }.to change(Book, :count).by(-1)
    end
  end
end