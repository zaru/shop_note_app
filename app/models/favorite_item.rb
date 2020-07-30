require "nkf"
require 'kakasi'

class FavoriteItem < ApplicationRecord
  belongs_to :user
  belongs_to :group, optional: true
  validates :name, presence: true, uniqueness: true
end
