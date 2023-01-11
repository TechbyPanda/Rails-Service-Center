class ServiceCenterOwnerPolicy < ApplicationPolicy
  attr_reader :user, :service_center_owner

  def initialize(user, service_center_owner)
    @user = user
    @service_center_owner = service_center_owner
  end

  def index?
    false
  end

  def show?
    false
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    user.isAdmin? || service_center_owner.user_id == user.id
  end

  def edit?
    update?
  end

  def destroy?
    false
  end
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
