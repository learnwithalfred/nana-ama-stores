# frozen_string_literal: true

class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[^@\s]+@[^@\s]+\z/
  MAX_EMAIL_LENGTH = 50
  PASSWORD_LENGTH = 6..50
  MAX_NAME_LENGTH = 35
  validates :name, presence: true, length: { maximum: MAX_NAME_LENGTH }
  validates :email,
    presence: true,
    uniqueness: { case_sensitive: false },
    length: { maximum: MAX_EMAIL_LENGTH },
    format: { with: VALID_EMAIL_REGEX }
  # validates :password, length: { in: PASSWORD_LENGTH }

  before_save :to_lowercase
  has_many :stores
  # has_many :store_taxes

  enum role: [:user, :collector, :procurement, :it, :statistics, :admin, :super_admin]
  after_initialize :set_default_role, if: :new_record?
  def set_default_role # set default role to user  if not set
    self.role ||= :user
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable

  private

    def to_lowercase
      email.downcase!
    end
end
