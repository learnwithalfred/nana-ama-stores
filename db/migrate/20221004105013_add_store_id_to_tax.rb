# frozen_string_literal: true

class AddStoreIdToTax < ActiveRecord::Migration[7.0]
  def change
    add_column :taxes, :store_id, :integer, default: 1
  end
end
