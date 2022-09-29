# frozen_string_literal: true

class Payment < ApplicationRecord
  validates :amount, presence: true, numericality: { greater_than: 0, less_than: 10000 }
  MIN_LENGTH = 3
  MAX_LENGTH = 255
  validates :payee, presence: true, length: { minimum: MIN_LENGTH, maximum: MAX_LENGTH }

  belongs_to :user
  belongs_to :store
  belongs_to :tax
end
