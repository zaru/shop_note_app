class User < ApplicationRecord
  has_many :notes, dependent: :destroy
  has_many :groups, through: :group_members
  has_many :group_members
end
