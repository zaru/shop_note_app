class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name, null: false,unique: true
      t.string :email, null: false, unique: true
      t.string :password_digest
      t.string :remember_digest
      t.timestamps
    end
  end
end
