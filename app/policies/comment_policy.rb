class CommentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    # Even guests can write comments. Maybe captcha needed for them
    true
  end

  def show?
    false
  end

  def update?
    (@user == @record.user && @record.created_at > DateTime.now - 1) || admin?
    false
  end

  def destroy?
    admin?
  end
end
