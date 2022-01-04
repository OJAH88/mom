class CreateShoppingLists < ActiveRecord::Migration[6.1]
  def change
    create_table :shopping_lists do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.string :item

      t.timestamps
    end
  end
end
