class HomeController < ApplicationController

  def index
    @feed = Note.all

  end

  def help
  end

end
