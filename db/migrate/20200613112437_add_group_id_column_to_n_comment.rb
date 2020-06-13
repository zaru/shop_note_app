class AddGroupIdColumnToNComment < ActiveRecord::Migration[5.1]
  def change
    add_column :n_comments, :group_id, :integer, after: :user_id
  end
end
