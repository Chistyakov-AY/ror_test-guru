class AddColumnToTests < ActiveRecord::Migration[6.1]
  def change
    add_column :tests, :publication, :boolean, default: false
  end
end
