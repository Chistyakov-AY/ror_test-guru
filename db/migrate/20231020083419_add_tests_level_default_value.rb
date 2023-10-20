class AddTestsLevelDefaultValue < ActiveRecord::Migration[6.1]
  def change
    change_column :tests, :level, :integer, default: 1
  end
end
