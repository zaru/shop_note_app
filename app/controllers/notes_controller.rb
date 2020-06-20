class NotesController < ApplicationController

  def create
    @user = User.find_by(id: current_user.id)
    @note = @user.notes.build(note_params)
    if @note.save
      flash[:success] = "投稿しました"
      redirect_to root_url
    else
      @feed = []
      flash[:danger] = "投稿に失敗しました"
      render 'home/index'
    end
  end

  def count
    @note = Note.find_by(params[:id])
    @count = params[:count]
    @note.count = @count.to_i
    if @note.save
      flash[:success] = "投稿しました"
      redirect_to root_url
    else
      flash[:danger] = "投稿に失敗しました"
      render 'home/index'

    end
  end

  def destroy

    params[:i][:id].each do |note_id|
      Note.find_by(id: note_id).delete
    end
    redirect_to request.referrer || root_url
  end

  private

  def note_params
      params.permit(:content)
    end


end
