class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :note
  validates :content, length: { maximum: 10 }
end
