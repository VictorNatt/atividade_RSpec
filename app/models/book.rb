class Book < ApplicationRecord
  # validações básicas
  validates :title, presence: true
  validates :author, presence: true

  has_many :loans
  has_many :users, through: :loans
end
