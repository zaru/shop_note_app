class CreateProductRegistrations < ActiveRecord::Migration[5.1]
  def change
    create_table :product_registrations do |t|
      t.string :name, null: false
      t.references :user,foreign_key: true
      t.references :group,foreign_key: true
      t.timestamps
    end
  end
end
