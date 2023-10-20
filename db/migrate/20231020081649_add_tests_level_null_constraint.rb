class AddTestsLevelNullConstraint < ActiveRecord::Migration[6.1]
  def change
    change_column_null(:tests, :level, false)
    change_column_null(:tests, :category_id, false)
  end
end
