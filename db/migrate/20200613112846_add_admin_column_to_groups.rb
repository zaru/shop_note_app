class AddAdminColumnToGroups < ActiveRecord::Migration[5.1]
  def change
    add_column :groups, :admin, :boolean, after: :name
  end
end
