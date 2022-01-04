class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :name
      t.string :food_group
      t.string :description
      t.string :imgurl
      t.string :item
      t.integer :amount
      t.string :measurement_type
      t.boolean :in_kitchen
      t.boolean :in_fridge
      t.boolean :in_freezer
      t.boolean :in_pantry
      t.boolean :in_shopping_list
      t.belongs_to :recipe, null: true, foreign_key: true, optional: true, :null => true
      t.belongs_to :food_log, null: true, foreign_key: true, optional: true, :null => true
      t.belongs_to :kitchen, null: true, foreign_key: true, optional: true, :null => true
      t.belongs_to :user, foreign_key: true, optional: true, :null => true

      t.timestamps
    end
  end
end
