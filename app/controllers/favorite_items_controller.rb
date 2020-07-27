class FavoriteItemsController < ApplicationController
    before_action :authenticate_user!
    before_action :correct_user, only: [:destroy]

    def index
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
      i = Kakasi.kakasi('-JH -KH',item.name)
      i_initial = NKF.nkf("-h1 -w",i[0]).tr("A-Z0-9","Ａ-Ｚ０-９")
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

    def create
      params[:favorite_item][:name].split(/[[:blank:]]+/).each do |item|
        product = current_user.favorite_items.create(name: item)
      end
        redirect_to favorite_items_path
    end

    def destroy
      Favorite_item.find(params[:id]).destroy
      flash[:success] = "削除しました"
      redirect_to request.referrer || root_url
    end

    def bluk_posting
      params[:item][:id].each do |item_id|
        item = current_user.favorite_items.find_by(id: item_id)
        note = Note.create(content: item.name,user_id: item.user_id,group_id:item.group_id)
      end
        redirect_to root_path
    end

    private

      # def product_params
      #   params.require(:favorite_items).permit(:name)
      # end
end
