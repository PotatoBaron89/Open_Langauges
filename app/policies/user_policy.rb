class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def edit?
    @user.has_role? :admin
  end

  def index?
    # Only admins can see all users for privacy reasons
    @user.has_role? :admin
  end

  def show?
    @user.has_role? :admin or @record.id == @user.id
  end

  def create?
    false
  end

  def new?
    false
  end

  def update?
    @user.has_role? :admin || @record.user_id == @user.id
  end

  def account?
    @record.id == @user.id
  end

  def destroy?
    @user.has_role? :admin || @record.user_id == @user.id
  end
end
