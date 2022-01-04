class CreateFoodLogs < ActiveRecord::Migration[6.1]
  def change
    create_table :food_logs do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.datetime :eaten_at
      t.string :item
      t.integer :amount
      t.string :measurement_type
      t.boolean :remove_from_kitchen
      t.boolean :add_to_shopping_list

      t.timestamps
    end
  end
end
