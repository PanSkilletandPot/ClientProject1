class CreateIngredients < ActiveRecord::Migration[5.1]
  def change
    create_table :ingredients do |t|
      t.string :ingredient, presence: true
      t.references :recipe, foreign_key: true, index: true, presence: true

      t.timestamps
    end
  end
end
