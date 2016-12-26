class UnitPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end


  def create?
    admin? || user?
  end

  def show?
    true
  end

  def update?
    admin?
  end

  def destory?
    admin?
  end
end
