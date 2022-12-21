# frozen_string_literal: true

class Payment < ApplicationRecord
  validates :amount, presence: true, numericality: { greater_than: 0, less_than: 10000 }
  MIN_LENGTH = 3
  MAX_LENGTH = 255
  validates :payee, presence: true, length: { minimum: MIN_LENGTH, maximum: MAX_LENGTH }

  belongs_to :author
  belongs_to :store
  belongs_to :tax

  before_save do
    self.payment_complete = self.amount >= self.tax.amount
    if self.amount >= self.tax.amount
      self.balance = self.amount - self.tax.amount
      self.arrears = 0
      else
        self.arrears = self.tax.amount - self.amount
        self.balance = 0
    end
  end
end
