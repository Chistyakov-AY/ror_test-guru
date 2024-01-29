class AddColumnToTestPassage < ActiveRecord::Migration[6.1]
  def change
    add_column :test_passages, :question_id, :integer
  end
end
