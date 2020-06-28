class HomeController < ApplicationController

  def index
    @feed = Note.all
    @groups = Group.select(:id,:name)

  end

  def help
  end

end
