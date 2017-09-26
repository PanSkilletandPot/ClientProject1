class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.integer :rating, null: false
      t.text :body, null: false
      t.references :user, foreign_key: true, index: true
      t.references :recipe, foreign_key: true, index: true

      t.timestamps
    end
  end
end
