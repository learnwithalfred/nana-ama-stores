# frozen_string_literal: true

class AddYearToTax < ActiveRecord::Migration[7.0]
  def change
    add_column :taxes, :year, :integer, default: 2022
  end
end
