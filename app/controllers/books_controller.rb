class BooksController < ApplicationController
  before_action :set_book, only: %i[show edit update destroy]

  # Garante que todas as ações sejam verificadas pelo Pundit
  after_action :verify_authorized, except: :index
  after_action :verify_policy_scoped, only: :index

  def index
    @books = policy_scope(Book)
    authorize Book
  end

  def show
    authorize @book
  end

  def new
    @book = Book.new
    authorize @book
  end

  def create
    @book = Book.new(book_params)
    authorize @book

    if @book.save
      redirect_to @book, notice: "Livro criado com sucesso!"
    else
      render :new
    end
  end

  def edit
    authorize @book
  end

  def update
    authorize @book
    if @book.update(book_params)
      redirect_to @book, notice: "Livro atualizado!"
    else
      render :edit
    end
  end

  def destroy
    authorize @book
    @book.destroy
    redirect_to books_path, notice: "Livro excluído!"
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :author, :description)
  end

end
