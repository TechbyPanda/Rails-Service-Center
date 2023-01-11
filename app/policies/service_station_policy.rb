class ServiceStationPolicy < ApplicationPolicy
  attr_reader :user, :service_station

  def initialize(user, service_station)
    @user = user
    @service_station = service_station
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
    user.isAdmin? || service_station.user_id == user.id
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
