# frozen_string_literal: true

class CreateAssemblies < ActiveRecord::Migration[7.0]
  def change
    create_table :assemblies do |t|
      t.string :name, null: false, unique: true

      t.timestamps
    end
  end
end
