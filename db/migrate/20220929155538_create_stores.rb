# frozen_string_literal: true

class CreateStores < ActiveRecord::Migration[7.0]
  def change
    create_table :stores do |t|
      t.references :assembly, null: false, foreign_key: true
      t.references :author, null: false, foreign_key: true
      t.references :sub_district, null: false, foreign_key: true
      t.references :community, null: false, foreign_key: true
      t.references :sector, null: false, foreign_key: true
      t.string :serial_number, null: false, unique: true
      t.string :digital_address, null: false
      t.string :purpose_of_structure, null: false
      t.string :mode_of_structure, null: false
      t.string :materials_used_for_walls, null: false
      t.text :address, null: false
      t.boolean :is_there_network_mast, null: false
      t.text :comments

      t.timestamps
    end
  end
end
