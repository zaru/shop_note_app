class HomeController < ApplicationController

  def index
    if current_user.present?
      @own_notes = current_user.notes.all
    else
      @own_notes = []
    end
  end

  def help
  end

  def tutorial_top
  end

  def tutorial_note_index
    if current_user.present?
      @own_notes = current_user.notes.all
    else
      @own_notes = []
    end
  end

  def tutorial_note
    if current_user.notes.present?
      @own_notes = current_user.notes.all
    else
      @own_notes = []
    end
  end

  def tutorial_create_f_item
    @favorite_item = current_user.favorite_items.new
    @favorite_items = current_user.favorite_items.all
    @A_line = []
    @K_line = []
    @S_line = []
    @T_line = []
    @N_line = []
    @H_line = []
    @M_line = []
    @Y_line = []
    @R_line = []
    @W_line = []
    @other_line = []

      @favorite_items.each do |item|
        i_initial = NKF.nkf("-h1 -w",item.name[0]).tr("A-Z0-9","Ａ-Ｚ０-９")
          if ["あ","い","う","え","お","a","i","u","e","o","A","I","U","E","O"].include?(i_initial)
            @A_line << item
          elsif ["か","き","く","け","こ","が","ぎ","ぐ","げ","ご","c","k","q","C","K","Q"].include?(i_initial)
            @K_line << item
          elsif ["さ","し","す","せ","そ","ざ","じ","ず","ぜ","ぞ","s","z","S","Z"].include?(i_initial)
            @S_line << item
          elsif ["た","ち","つ","て","と","だ","ぢ","づ","で","ど","t","d","T","D"].include?(i_initial)
            @T_line << item
          elsif ["な","に","ぬ","ね","の","n","N"].include?(i_initial)
            @N_line << item
          elsif ["は","ひ","ふ","へ","ほ","ば","び","ぶ","べ","ぼ","h","b","H","B"].include?(i_initial)
            @H_line << item
          elsif ["ま","み","む","め","も","m","M"].include?(i_initial)
            @M_line << item
          elsif ["や","ゆ","よ","y","Y"].include?(i_initial)
            @Y_line << item
          elsif ["ら","り","る","れ","ろ","l","r","L","R"].include?(i_initial)
            @R_line << item
          elsif ["わ","を","ん"].include?(i_initial)
            @W_line << item
          else
            @other_line << item
          end
      end
  end

  def tutorial_index_f_item
    @favorite_items = current_user.favorite_items.all
    @A_line = []
    @K_line = []
    @S_line = []
    @T_line = []
    @N_line = []
    @H_line = []
    @M_line = []
    @Y_line = []
    @R_line = []
    @W_line = []
    @other_line = []

      @favorite_items.each do |item|
        i_initial = NKF.nkf("-h1 -w",item.name[0]).tr("A-Z0-9","Ａ-Ｚ０-９")
          if ["あ","い","う","え","お","a","i","u","e","o","A","I","U","E","O"].include?(i_initial)
            @A_line << item
          elsif ["か","き","く","け","こ","が","ぎ","ぐ","げ","ご","c","k","q","C","K","Q"].include?(i_initial)
            @K_line << item
          elsif ["さ","し","す","せ","そ","ざ","じ","ず","ぜ","ぞ","s","z","S","Z"].include?(i_initial)
            @S_line << item
          elsif ["た","ち","つ","て","と","だ","ぢ","づ","で","ど","t","d","T","D"].include?(i_initial)
            @T_line << item
          elsif ["な","に","ぬ","ね","の","n","N"].include?(i_initial)
            @N_line << item
          elsif ["は","ひ","ふ","へ","ほ","ば","び","ぶ","べ","ぼ","h","b","H","B"].include?(i_initial)
            @H_line << item
          elsif ["ま","み","む","め","も","m","M"].include?(i_initial)
            @M_line << item
          elsif ["や","ゆ","よ","y","Y"].include?(i_initial)
            @Y_line << item
          elsif ["ら","り","る","れ","ろ","l","r","L","R"].include?(i_initial)
            @R_line << item
          elsif ["わ","を","ん"].include?(i_initial)
            @W_line << item
          else
            @other_line << item
          end
      end
  end

  def tutorial_group_SearchUser
    @group = Group.find(params[:id])
    @members = @group.group_members.where(activated: true)
  end
end
