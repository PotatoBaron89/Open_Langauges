class WishPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def edit?
    true
  end

  def index?
    true
  end

  def show?
    false
  end

  def create?
    true
  end

  def new?
    true
  end

  def update?
    true
  end

  def destroy?
    true
  end
end
