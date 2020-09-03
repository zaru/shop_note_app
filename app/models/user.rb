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

  # お気に入りアイテムを、日本語索引でグルーピングした配列を返す
  # @return [Hash]
  def favorite_item_groups
    a_line = []
    k_line = []
    s_line = []
    t_line = []
    n_line = []
    h_line = []
    m_line = []
    y_line = []
    r_line = []
    w_line = []
    other_line = []

    favorite_items.each do |item|
      i_initial = NKF.nkf("-h1 -w",item.name[0]).tr("A-Z0-9","Ａ-Ｚ０-９")
      case i_initial
      when "あ","い","う","え","お","a","i","u","e","o","A","I","U","E","O"
          a_line << item
      when "か","き","く","け","こ","が","ぎ","ぐ","げ","ご","c","k","q","C","K","Q"
          k_line << item
      when "さ","し","す","せ","そ","ざ","じ","ず","ぜ","ぞ","s","z","S","Z"
          s_line << item
      when "た","ち","つ","て","と","だ","ぢ","づ","で","ど","t","d","T","D"
          t_line << item
      when "な","に","ぬ","ね","の","n","N"
          n_line << item
      when "は","ひ","ふ","へ","ほ","ば","び","ぶ","べ","ぼ","h","b","H","B"
          h_line << item
      when "ま","み","む","め","も","m","M"
          m_line << item
      when "や","ゆ","よ","y","Y"
          y_line << item
      when "ら","り","る","れ","ろ","l","r","L","R"
          r_line << item
      when "わ","を","ん"
          w_line << item
      else
          other_line << item
      end
    end

    [
      { idx: "あ行", items: a_line },
      { idx: "か行", items: k_line },
      { idx: "さ行", items: s_line },
      { idx: "た行", items: t_line },
      { idx: "な行", items: n_line },
      { idx: "は行", items: h_line },
      { idx: "ま行", items: m_line },
      { idx: "や行", items: y_line },
      { idx: "ら行", items: r_line },
      { idx: "わ行", items: w_line },
      { idx: "その他", items: other_line }
    ]
  end

end
