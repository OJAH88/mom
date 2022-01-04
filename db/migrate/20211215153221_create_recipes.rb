class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.references :user, foreign_key: true, optional: true
      t.string :name
      t.integer :length_minutes
      t.text :instructions
      t.boolean :favorite

      t.timestamps
    end
  end
end
