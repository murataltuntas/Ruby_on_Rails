class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.references :post, index: true, foreign_key: true
      t.string :userNameLiked

      t.timestamps null: false
    end
  end
end
