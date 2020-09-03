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
  has_many :reviews

  mount_uploader :image, ImageUploader

  JP_INDEX = {
    "あ行" => ["あ","い","う","え","お","a","i","u","e","o","A","I","U","E","O"],
    "か行" => ["か","き","く","け","こ","が","ぎ","ぐ","げ","ご","c","k","q","C","K","Q"],
    "さ行" => ["さ","し","す","せ","そ","ざ","じ","ず","ぜ","ぞ","s","z","S","Z"],
    "た行" => ["た","ち","つ","て","と","だ","ぢ","づ","で","ど","t","d","T","D"],
    "な行" => ["な","に","ぬ","ね","の","n","N"],
    "は行" => ["は","ひ","ふ","へ","ほ","ば","び","ぶ","べ","ぼ","h","b","H","B"],
    "ま行" => ["ま","み","む","め","も","m","M"],
    "や行" => ["わ","を","ん"],
    "ら行" => ["わ","を","ん"],
    "わ行" => ["わ","を","ん"],
    "その他" => []
  }

  # お気に入りアイテムを、日本語索引でグルーピングした配列を返す
  # @return [Hash]
  def favorite_item_groups
    item_groups = JP_INDEX.keys.map{ |v| [v, []] }.to_h

    favorite_items.each do |item|
      i_initial = NKF.nkf("-h1 -w",item.name[0]).tr("A-Z0-9","Ａ-Ｚ０-９")
      key = index_name(i_initial)
      item_groups[key] << item
    end
    item_groups
  end


  private

  # @param [String] initial
  # @return [String] e.g. "あ行"
  def index_name(initial)
    JP_INDEX.each do |key, value|
      if value.include?(initial)
        return key
      end
    end
    return "その他"
  end
end
