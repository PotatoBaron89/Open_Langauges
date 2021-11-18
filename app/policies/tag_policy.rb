class TagPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  # FEATURE NOT IMPLEMENTED YET
  #
  def edit?
    @user.has_role? :admin || @record.user_id == @user.id
  end

  def index?
    @user.has_role? :admin
  end

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
