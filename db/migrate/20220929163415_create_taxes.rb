# frozen_string_literal: true

class CreateTaxes < ActiveRecord::Migration[7.0]
  def change
    create_table :taxes do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name, null: false
      t.string :description, null: false
      t.string :period, null: false
      t.decimal :amount, default: 0, null: false

      t.timestamps
    end
  end
end
