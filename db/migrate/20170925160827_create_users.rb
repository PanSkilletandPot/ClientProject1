class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username, presence: true, uniqueness: true
      t.string :email, presence: true, uniqueness: true
      t.string :password_digest, presence: true

      t.timestamps
    end
    add_index :users, :username, unique: true
    add_index :users, :email, unique: true
  end
end
