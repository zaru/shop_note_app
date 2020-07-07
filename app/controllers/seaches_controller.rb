class SeachesController < ApplicationController

  def index
    @users = User.all
    @groups = Group.all
  end

  def find
    if params[:name].present?
      @seach_users = User.where('name LIKE ?', "%#{params[:name]}%")
    else
      flash.now[:danger] = "指定のユーザーは存在しません"
      @users = User.none
    end
  end
end
