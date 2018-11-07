class BoatPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
      # scope.where(user: user) # just voir les boats du user
    end
  end

  def create?
    true
  end

  def show?
    true
  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end
end
