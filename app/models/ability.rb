

# frozen_string_literal: true

class Ability
  include CanCan::Ability

  # def initialize(author)
  #   can :read, Community
  #   can :read, SubDistrict
  #   can :read, Sector
  #   can :read, Assembly
  #   can :manage, :all if author.admin? || author.super_admin? || author.it? || author.super_admin?
  #   can [:create, :read, :update], Store if author.collector? || author.statistics? || author.procurement?
  #   can [:create, :read, :update], Tax if author.collector? || author.statistics? || author.procurement?
  #   can [:create, :read, :update], StoreTax if author.collector? || author.statistics? || author.procurement?
  #   can [:create, :read, :update], Payment if author.collector? || author.statistics? || author.procurement?
  #   cannot :destroy,
  #     :all if author.collector? || author.statistics? || author.procurement? || author.admin? || author.super_admin? || author.it?
  # end
end
