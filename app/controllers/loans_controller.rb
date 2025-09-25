class LoansController < ApplicationController
  before_action :set_loan, only: [:destroy]

  def index
    if current_user.admin?
      @loans = Loan.includes(:user, :book).all
    else
      @loans = current_user.loans.includes(:book)
    end
  end

  def create
    @book = Book.find(params[:book_id])

    if @book.loans.exists?(returned: false)
      redirect_to books_path, alert: "Este livro já está sendo emprestado."
    else
      @loan = @book.loans.build(user: current_user)
      if @loan.save
        redirect_to books_path, notice: "Livro emprestado com sucesso!"
      else
        redirect_to books_path, alert: "Não foi possível emprestar o livro."
      end
    end
  end


  def destroy
    @loan.destroy
    redirect_to loans_path, notice: "Empréstimo excluído com sucesso."
  end

  private

  def set_loan
    @loan = Loan.find(params[:id])
  end
end
