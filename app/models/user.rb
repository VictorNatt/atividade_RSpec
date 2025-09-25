class User < ApplicationRecord
  # Devise já vem configurado aqui
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Definindo papéis (roles)
  enum :role, { user: 0, admin: 1 }

  has_many :loans
  has_many :borrowed_books, through: :loans, source: :book
end
