class QuestionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def edit?
    @user.has_role? :admin or Question.find(@record.id).quiz.lesson.user_id == @user.id
  end

  # User doesn't need index or show, it is rendered from within Lessons for them to view
  def index?
    @user.has_role? :admin
  end

  def show?
    @user.has_role? :admin or Question.find(@record.id).quiz.lesson.user_id == @user.id
  end

  def create?
    true
  end

  def new?
    true
  end

  def update?
    @user.has_role? :admin or Question.find(@record.id).quiz.lesson.user_id == @user.id
  end

  def destroy?
    @user.has_role? :admin or Question.find(@record.id).quiz.lesson.user_id == @user.id
  end
end
