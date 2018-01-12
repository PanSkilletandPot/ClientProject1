class CreateRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table :recipes do |t|
      t.string :recipe_name, presence: true
      t.string :category, presence: true
      t.string :prep_time, presence: true
      t.string :instructions, presence: true
      t.references :user, foreign_key: true, index: true, presence: true

      t.timestamps
    end
  end
end
