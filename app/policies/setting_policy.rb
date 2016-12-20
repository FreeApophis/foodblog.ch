class SettingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.get_all
    end
  end

  def edit?
    @user.admin?
  end

  def update?
    @user.admin?
  end
end
