class Group < ApplicationRecord
  has_many :group_members, dependent: :destroy
  has_many :users, through: :group_members
  has_many :notes, dependent: :destroy
  has_many :product_registrations, dependent: :destroy
  accepts_nested_attributes_for :group_members

  validates :name, presence: true
  validates :admin_user_id, presence: true, uniqueness: true
  validates :profile, length: { maximum: 100 }

  mount_uploader :image, ImageUploader
end
