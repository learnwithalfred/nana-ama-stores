# frozen_string_literal: true

class CreateSubDistricts < ActiveRecord::Migration[7.0]
  def change
    create_table :sub_districts do |t|
      t.string :name, null: false, unique: true

      t.timestamps
    end
  end
end
