class DashboardController < ApplicationController
  # só acessa se estiver logado
  before_action :authenticate_user!

  def index
    # Aqui você pode exibir informações do usuário logado
  end
end

