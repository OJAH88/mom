class CreateKitchens < ActiveRecord::Migration[6.1]
  def change
    create_table :kitchens do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.boolean :fridge
      t.boolean :freezer
      t.boolean :pantry
      t.timestamps
    end
  end
end
