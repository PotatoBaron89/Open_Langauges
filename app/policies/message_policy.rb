class MessagePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def edit?
    @user.has_role? :admin || @record.user_id == @user.id
  end

  # Users don't need access to index, displayed through channels page
  def index?
    @user.has_role? :admin
  end

  # Users don't need access to show, displayed through channels page
  def show?
    @user.has_role? :admin
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
