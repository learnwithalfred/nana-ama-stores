# frozen_string_literal: true

class Tax < ApplicationRecord
  MIN_LENGTH = 3
  MAX_LENGTH = 255
  validates :name, presence: true, length: { minimum: MIN_LENGTH, maximum: MAX_LENGTH }
  validates :description, presence: true, length: { minimum: MIN_LENGTH }
  validates :period, presence: true, length: { minimum: MIN_LENGTH, maximum: MAX_LENGTH }
  validates :amount, presence: true, numericality: { greater_than: 0, less_than: 10000 }
  belongs_to :user
end
