class CommentPolicy < ApplicationPolicy
  def create?
    true
  end

  def edit?
    owner? || admin?
  end

  def update?
    owner? || admin?
  end

  def delete?
    owner? || admin?
  end
end
