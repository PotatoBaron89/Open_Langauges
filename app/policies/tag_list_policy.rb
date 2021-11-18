class TagListPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  # FEATURE NOT IMPLEMENTED YET

  def edit?
    @user.has_role? :admin
  end

  def index?
    @user.has_role? :admin
  end

  def show?
    @user.has_role? :admin
  end

  def create?
    @user.has_role? :admin
  end

  def new?
    @user.has_role? :admin?
  end

  def update?
    @user.has_role? :admin
  end

  def destroy?
    @user.has_role? :admin
  end
end
