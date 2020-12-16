class GroupPolicy < ApplicationPolicy
  attr_reader :user, :group
 
  def new?
    user.teacher?
  end

  def index?
    !user.teacher?
  end

  def show?
    true
  end

  def create?
    user.teacher?
  end

  def destroy?
    user.teacher && record.teacher == user
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
