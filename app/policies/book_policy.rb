class BookPolicy < ApplicationPolicy
  def index?
    true # todos podem ver os livros
  end

  def show?
    true # todos podem abrir detalhes
  end

  def create?
    user.admin? # só admin pode criar
  end

  def update?
    user.admin? # só admin pode editar
  end

  def destroy?
    user.admin? # só admin pode excluir
  end

  # escopo para index
  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
