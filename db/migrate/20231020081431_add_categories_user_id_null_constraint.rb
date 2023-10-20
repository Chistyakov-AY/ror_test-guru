class AddCategoriesUserIdNullConstraint < ActiveRecord::Migration[6.1]
  def change
    change_column_null(:categories, :user_id, false)
  end
end
