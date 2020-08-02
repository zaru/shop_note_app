class HomeController < ApplicationController

  def index
    if current_user.present?
      @own_notes = current_user.notes
    else
      @own_notes = []
    end
  end

  def help
  end

end
