class QuizPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def edit?
    @user.has_role? :admin || @record.user_id == @user.id
  end

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
    @user.has_role? :admin || @record.user_id == @user.id
  end

  def destroy?
    @user.has_role? :admin || @record.user_id == @user.id
  end
end
