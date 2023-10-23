class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :title, null: false

      t.timestamps
    end
  end
end
