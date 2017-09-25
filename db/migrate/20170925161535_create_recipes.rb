class CreateRecipes < ActiveRecord::Migration[5.1]
  def changeg
    create_table :recipes do |t|
      t.string :recipe_name, null: false
      t.string :category, null: false
      t.string :ingredients, null: false
      t.string :prep_time, null: false
      t.string :instructions, null: false
      t.references :user, foreign_key: true, index: true

      t.timestamps
    end
  end
end
