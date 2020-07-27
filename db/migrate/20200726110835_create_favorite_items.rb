class CreateFavoriteItems < ActiveRecord::Migration[5.1]
  def change
    create_table :favorite_items do |t|
      t.string :name, null: false, unique: true
      t.references :user,foreign_key: true
      t.references :group,foreign_key: true
      t.timestamps
    end
  end
end
