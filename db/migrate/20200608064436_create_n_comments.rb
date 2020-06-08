class CreateNComments < ActiveRecord::Migration[5.1]
  def change
    create_table :n_comments do |t|
      t.text :comment, limit:20
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
