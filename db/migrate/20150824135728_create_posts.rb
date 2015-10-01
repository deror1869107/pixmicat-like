class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :name
      t.string :email
      t.string :sub
      t.text :com
      t.string :deletePassword
      t.integer :push
      t.integer :board_id
      t.string :ID

      t.timestamps null: false
    end
  end
end
