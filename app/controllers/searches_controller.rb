class SearchesController < ApplicationController

    def find
      if params[:name].present?
        @search_users = User.where('name LIKE ?', "%#{params[:name]}%")
      else
        flash[:danger] = "指定のユーザーは存在しません"
        @users = User.none
      end
    end
end
