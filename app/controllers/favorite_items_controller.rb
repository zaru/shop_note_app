class FavoriteItemsController < ApplicationController
    before_action :authenticate_user!
    before_action :correct_user, only: [:destroy]

    def index
      favorite_items = current_user.favorite_items.all
      @item_exists = favorite_items.present?
      @favorite_item_groups = current_user.favorite_item_groups
    end

    def new
      favorite_items = current_user.favorite_items.all
      @item_exists = favorite_items.present?
      @favorite_item_groups = current_user.favorite_item_groups

      @favorite_item = current_user.favorite_items.new
    end

    def create
      if params[:favorite_item][:name].present?
        params[:favorite_item][:name].split(/[[:blank:]]+/).each do |item|
          unless FavoriteItem.find_by(name: item,user_id: current_user.id).present?
            current_user.favorite_items.create(name: item)
          end
        end
        url = Rails.application.routes.recognize_path(request.referrer)
        if url == {:controller=>"home", :action=>"tutorial_create_f_item"}
          flash[:success] = "登録に成功しました！ページ下部のリンクから次のページへ進みましょう！"
          redirect_to tutorial_create_f_item_path
        else
          flash[:success] = "お気に入り商品を登録しました"
          redirect_to request.referrer || favorite_items_path
        end
      else
        flash[:danger] = "登録に失敗しました"
        redirect_to request.referrer || root_url
      end
    end

    def destroy
      params[:item][:id].each do |item_id|
        current_user.favorite_items.find_by(id: item_id).delete
      end
      flash[:warning] = "お気に入り商品を削除しました"
      redirect_to request.referrer || new_favorite_item_path
    end

    def post
      params[:item][:id].each do |item_id|
        item = current_user.favorite_items.find_by(id: item_id)
        note = Note.create(content: item.name, user_id: item.user_id, group_id: params[:group_id])
      end
        if params[:group_id].present?
          flash[:success] = "投稿しました"
          redirect_to chatroom_group_path(params[:group_id])
        else
          url = Rails.application.routes.recognize_path(request.referrer)
          if url == {:controller=>"home", :action=>"tutorial_index_f_item"}
            flash[:success] = "これでチュートリアルは終了！ページ下のボタンで移動し、アプリを使いはじめましょう！"
            redirect_to tutorial_note_index_path
          else
          flash[:success] = "投稿しました"
          redirect_to root_url
          end
        end
    end

    private

      def correct_user
        item = FavoriteItem.find(params[:item][:id]).first
        unless item.user_id == current_user.id
          flash[:danger] = "投稿者本人でないため削除出来ませんでした"
          redirect_to request.referrer || root_url
        end
      end
end
