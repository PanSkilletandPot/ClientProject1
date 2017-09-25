class IngredientsRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table :ingredients_recipes do |t|
      t.references :ingredients, foreign_key: true, index: true
      t.references :recipes, foreign_key: true, index: true

      t.timestamps
    end
  end
end
