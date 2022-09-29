# frozen_string_literal: true

class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.references :user, null: false, foreign_key: true
      t.decimal :amount, null: false
      t.references :store, null: false, foreign_key: true
      t.string :payee, null: false
      t.boolean :payment_complete
      t.decimal :balance
      t.decimal :arrears
      t.references :tax, null: false, foreign_key: true

      t.timestamps
    end
  end
end
