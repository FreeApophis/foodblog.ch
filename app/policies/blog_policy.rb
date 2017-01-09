class BlogPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      return scope.all if admin?
      scope.published
    end
  end

  def create?
    admin?
  end

  def show?
    scoped_record?
  end

  def update?
    admin?
  end

  def destroy
    admin?
  end
end
