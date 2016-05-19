class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :post, index: true, foreign_key: true
      t.string :userName
      t.text :comm

      t.timestamps null: false
    end
  end
end
