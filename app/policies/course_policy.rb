class CoursePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def edit?
    # Allow Admins / Creator / Educators of this Course
    @user.has_role? :admin or @record.user_id == @user.id or ClassEducator.find_by(user_id: @user.id, course: @record.id)
  end

  # User accesses list through #courselist which is public
  def index?
    @user.has_role? :admin
  end

  def show?
    true
  end

  def create?
    true
  end

  def new?
    true
  end

  def update?
    # Allow Admins / Creator / Educators of this Course
    @user.has_role? :admin or @record.user_id == @user.id or ClassEducator.find_by(user_id: @user.id, course: @record.id)
  end

  def destroy?
    # Educators do not have right to destroy course
    @user.has_role? :admin || @record.user_id == @user.id
  end


end
