class LessonPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def edit?
    # Allow admins / lesson creator / Course Creator to access
    @user.has_role? :admin or @record.user_id == @user.id or Lesson.find(@record.id).course.user.id == @user.id
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    # Allow Admins / Creator / Educators of the parent course
    # Attach to create as well as new in case someone tries to post direct to create controller
    @user.has_role? :admin or @record.user_id == @user.id or ClassEducator.find_by(user_id: @user.id, course: @record.course_id)
  end

  def new?
    # Allow Admins / Creator / Educators of the parent course
    @user.has_role? :admin or @record.user_id == @user.id or ClassEducator.find_by(user_id: @user.id, course: @record.course_id)
  end

  def update?
    # Allow admins / lesson creator / Course Creator to access
    @user.has_role? :admin or @record.user_id == @user.id or Lesson.find(@record.id).course.user.id == @user.id
  end

  def destroy?
    # Allow admins / lesson creator / Course Creator to access
    @user.has_role? :admin or @record.user_id == @user.id or Lesson.find(@record.id).course.user.id == @user.id
  end

end
