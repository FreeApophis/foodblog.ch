class IngredientPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    user? || admin?
  end

  def show?
    true
  end

  def update?
    admin?
  end

  def destroy?
    admin?
  end
end
