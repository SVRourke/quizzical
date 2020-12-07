class ResultPolicy < ApplicationPolicy
  def new?
    !user.teacher?
  end

  def create?
    !user.teacher?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
