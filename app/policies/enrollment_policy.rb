class EnrollmentPolicy < Struct.new(:user, :enrollment)
  def new?
    !user.teacher?
  end

  def create?
    !user.teacher?
  end
end
