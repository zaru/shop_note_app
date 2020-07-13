class NotesController < ApplicationController
  include ActionView::Helpers::UrlHelper


  def create
    @user = User.find_by(id: current_user.id)
    @note = @user.notes.build(note_params)
    if @note.save
      redirect_to request.referrer || root_url
    else
      @feed = []
      flash[:danger] = "投稿に失敗しました"
      render 'home/index'
    end
  end

  def count
    @count = Note.find(params[:note_id])
    @count.count = params[:count]
    if @count.save
      flash[:success] = "投稿しました"
      redirect_to request.referrer || root_url
    else
      flash[:danger] = "投稿に失敗しました"
      render 'home/index'

    end
  end

  def destroy
    params[:feed][:id].each do |note_id|
      Note.find_by(id: note_id).delete
    end
    redirect_to request.referrer || root_url
  end

  private

  def note_params
      params.permit(:content,:group_id)
    end

  def count_params
    params.permit(:count)
  end
end
