class QuestionPolicy < ApplicationPolicy
  def new?
    @user.teacher?
  end

  def create?
    @user.teacher?
  end

  def destroy?
    @user.teacher? && @record.quiz.group.teacher == @user
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
