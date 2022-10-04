# frozen_string_literal: true

class ChangeColumnNull < ActiveRecord::Migration[7.0]
  def change
    change_column_null :taxes, :period, true
  end
end
