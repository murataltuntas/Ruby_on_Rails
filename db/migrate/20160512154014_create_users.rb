class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :nick
      t.string :departmant
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
