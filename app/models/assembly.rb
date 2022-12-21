# frozen_string_literal: true

class Assembly < ApplicationRecord
  MIN_LENGTH = 3
  MAX_LENGTH = 255
  validates :name, presence: true, length: { minimum: MIN_LENGTH, maximum: MAX_LENGTH }

  has_many :stores, dependent: :destroy
end
