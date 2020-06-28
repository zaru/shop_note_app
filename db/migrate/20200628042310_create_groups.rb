class CreateGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :groups do |t|
      t.string :name
      t.integer :admin_user_id
      t.text :profile
      t.timestamps
    end
  end
end
