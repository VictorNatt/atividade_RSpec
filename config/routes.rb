Rails.application.routes.draw do
  get "dashboard/index"
  get "home/index"

  # ==== Rotas de autenticação ====
  devise_for :users

  # ==== Rota pública ====
  root "home#index"  # página inicial pública

  # ==== Rotas privadas (somente logado) ====
  get 'dashboard', to: 'dashboard#index', as: 'dashboard'

  # Livros (CRUD)
    resources :books do
    resources :loans, only: [:create]
  end


  # emprestimos (CRUD)
  resources :loans, only: [:index, :create, :destroy]
end
