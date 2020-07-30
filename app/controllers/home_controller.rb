class HomeController < ApplicationController

  def index
    if current_user.present?
      @own_notes = current_user.notes
    else
      flash[:danger] ="ログインしてください"
      redirect_to login_path
    end
  end

  def help
  end

end
