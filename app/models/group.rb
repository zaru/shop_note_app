class Group < ApplicationRecord
  has_many :users, through: :group_members
  has_many :group_members
  accepts_nested_attributes_for :group_members
end
