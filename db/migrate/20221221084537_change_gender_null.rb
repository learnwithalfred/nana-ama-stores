class ChangeGenderNull < ActiveRecord::Migration[7.0]
  def change
    change_column_null :authors, :gender, true
  end
end
