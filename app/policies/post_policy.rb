class PostPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def create?
    true
  end

  def edit?
    owner? || admin?
  end

  def update?
    owner? || admin?
  end

  def destroy?
    admin?
  end
end
