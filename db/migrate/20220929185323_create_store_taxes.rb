# frozen_string_literal: true

class CreateStoreTaxes < ActiveRecord::Migration[7.0]
  def change
    create_table :store_taxes do |t|
      t.belongs_to :store, null: false, foreign_key: true
      t.belongs_to :tax, null: false, foreign_key: true

      t.timestamps
    end
  end
end
