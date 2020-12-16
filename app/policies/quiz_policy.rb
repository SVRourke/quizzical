class QuizPolicy < ApplicationPolicy
  def new?
    user.teacher?
  end

  def create?
    user.teacher?
  end

  def publish?
    user.teacher?
  end

  def show?
    user.teacher?
  end

  def destroy?
    user.teacher? && record.group.teacher == user
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
