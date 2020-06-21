class CreateGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :groups do |t|
      t.string :name, null: false
      t.boolean :group_admin, default: false, null: false
      t.index :name, unique: true
      t.timestamps
    end
  end
end
