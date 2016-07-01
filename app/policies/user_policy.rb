class UserPolicy < ApplicationPolicy
  def update?
    user.role? :admin
  end
end