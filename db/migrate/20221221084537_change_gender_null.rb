class ChangeGenderNull < ActiveRecord::Migration[7.0]
  def change
    change_column_null :users, :gender, true
  end
end
