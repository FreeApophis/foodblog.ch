class SearchPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def search?
    true
  end

  def tags?
    true
  end

  def ingredients?
    true
  end
end
