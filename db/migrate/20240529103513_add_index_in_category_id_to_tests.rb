class AddIndexInCategoryIdToTests < ActiveRecord::Migration[6.1]
  def change
    add_index :tests, :category_id
  end
end
