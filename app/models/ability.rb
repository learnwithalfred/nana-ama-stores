# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Community
    can :read, SubDistrict
    can :read, Sector
    can :manage, :all if user.admin? || user.super_admin? || user.it?
    can [:create, :read, :update], Store if user.collector?
    can [:create, :read, :update], Tax if user.collector?
    can [:create, :read, :update], StoreTax if user.collector? || user.statistics?
    can [:create, :read, :update], Payment if user.collector? || user.statistics?
  end
end
