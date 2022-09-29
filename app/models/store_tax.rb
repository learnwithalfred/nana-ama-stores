# frozen_string_literal: true

class StoreTax < ApplicationRecord
  belongs_to :store
  belongs_to :tax
end
