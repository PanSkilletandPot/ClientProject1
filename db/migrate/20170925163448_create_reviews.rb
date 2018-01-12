class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.integer :rating, presence: true
      t.text :body, presence: true
      t.references :user, foreign_key: true, index: true, presence: true
      t.references :recipe, foreign_key: true, index: true, presence: true

      t.timestamps
    end
  end
end
