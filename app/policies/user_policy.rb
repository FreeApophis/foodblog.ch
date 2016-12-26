class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def update?
    @record == @user || admin?
  end

  def destroy?
    false
  end
end
