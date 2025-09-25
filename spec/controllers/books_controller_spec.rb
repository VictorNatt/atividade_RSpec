require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  let(:admin) { create(:user, role: :admin) }
  let(:user) { create(:user) }
  let(:book) { create(:book) }

  describe "GET #index" do
    it "returns success" do
      sign_in user
      get :index
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns success" do
      sign_in user
      get :show, params: { id: book.id }
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    it "creates book as admin" do
      sign_in admin
      expect {
        post :create, params: { book: attributes_for(:book) }
      }.to change(Book, :count).by(1)
    end

    it "does not create book as normal user" do
      sign_in user
      expect {
        post :create, params: { book: attributes_for(:book) }
      }.not_to change(Book, :count)
    end
  end

  describe "PATCH #update" do
    it "updates book as admin" do
      sign_in admin
      patch :update, params: { id: book.id, book: { title: "Novo Título" } }
      expect(book.reload.title).to eq("Novo Título")
    end
  end

  describe "DELETE #destroy" do
    it "destroys book as admin" do
      sign_in admin
      book_to_delete = create(:book)
      expect {
        delete :destroy, params: { id: book_to_delete.id }
      }.to change(Book, :count).by(-1)
    end
  end
end