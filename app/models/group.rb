class Group < ApplicationRecord
  has_many :group_members, dependent: :destroy
  has_many :users, through: :group_members
  has_many :notes, dependent: :destroy
  has_many :product_registrations, dependent: :destroy
  accepts_nested_attributes_for :group_members
  mount_uploader :image, ImageUploader
end
