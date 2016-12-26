class SettingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if admin?
        scope.get_all
      else
        scope.none
      end
    end
  end

  def show?
    scoped_record?
  end

  def update?
    admin?
  end
end
