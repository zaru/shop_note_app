class Note < ApplicationRecord
  belongs_to :user
  belongs_to :group, optional: true 
  has_many :comments, dependent: :destroy
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 10 }

end
