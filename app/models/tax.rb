# frozen_string_literal: true

class Tax < ApplicationRecord
  MIN_LENGTH = 3
  MAX_LENGTH = 255
  validates :name, presence: true, length: { minimum: MIN_LENGTH, maximum: MAX_LENGTH }
  validates :description, presence: true, length: { minimum: MIN_LENGTH }
  validates :amount, presence: true, numericality: { greater_than: 0, less_than: 10000 }
  validates :year, presence: true, numericality: { greater_than: 2020, less_than: 2050 }
  validates :store_id, presence: true
  belongs_to :user
  has_many :store_taxes, dependent: :destroy
  has_many :stores, through: :store_taxes, dependent: :destroy
  has_many :payments, dependent: :destroy

  belongs_to :store
end
