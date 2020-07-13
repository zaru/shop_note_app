class Group < ApplicationRecord
  has_many :group_members, dependent: :destroy
  has_many :users, through: :group_members
  has_many :notes, dependent: :destroy
  accepts_nested_attributes_for :group_members

  def find
    @groups = current_user.groups.wherez
  end

end
