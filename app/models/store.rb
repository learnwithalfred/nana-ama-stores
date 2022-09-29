# frozen_string_literal: true

class Store < ApplicationRecord
  MIN_LENGTH = 3
  MAX_LENGTH = 255
  validates :serial_number, presence: true, length: { minimum: 10, maximum: 12 }
  validates :digital_address, presence: true, length: { minimum: MIN_LENGTH, maximum: MAX_LENGTH }
  validates :purpose_of_structure, presence: true, length: { minimum: MIN_LENGTH, maximum: MAX_LENGTH }
  validates :mode_of_structure, presence: true, length: { minimum: MIN_LENGTH, maximum: MAX_LENGTH }
  validates :materials_used_for_walls, presence: true, length: { minimum: MIN_LENGTH, maximum: MAX_LENGTH }
  validates :address, presence: true, length: { minimum: MIN_LENGTH, maximum: MAX_LENGTH }
  validates :is_there_network_mast, presence: true, length: { minimum: MIN_LENGTH, maximum: MAX_LENGTH }

  belongs_to :assembly
  belongs_to :user
  belongs_to :sub_district
  belongs_to :community
  belongs_to :sector
end
