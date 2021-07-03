class GroupMember < ApplicationRecord
  belongs_to :user
  belongs_to :group
  # MEMO: DB に物理ユニークがないので、した方が良い
  validates :group_id, uniqueness: { scope: :user_id }
end
