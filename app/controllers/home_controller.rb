class HomeController < ApplicationController

  def index
    @feed = Note.all
    @comment = Comment.all
  end

  def help
  end

end
