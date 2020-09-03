class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable,:validatable

  has_many :notes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :group_members
  has_many :groups, through: :group_members
  has_many :favorite_items, dependent: :destroy
  # MEMO: dependent: :destroy がないので user を削除しても残る、レビューを残したいなら nullify 指定が良い
  has_many :reviews
  # MEMO: キーの違うモデルをリレーションしたい場合
  has_many :own_groups, class_name: 'Group', foreign_key: :admin_user_id

  mount_uploader :image, ImageUploader
end
