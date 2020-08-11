class NotesController < ApplicationController
  before_action :authenticate_user!

  def create
    if params[:content].present?
      params[:content].split(/[[:blank:]]+/).each do |note|
        current_user.notes.create(content: note, group_id: params[:group_id], image: params[:image])
      end
      redirect_to request.referrer || root_url
    else
      flash[:danger] = "投稿に失敗しました"
        redirect_to request.referrer || root_url
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
    params[:note][:id].each do |note_id|
      Note.find_by(id: note_id).delete
    end
    redirect_to request.referrer || root_url
  end

  private

  def note_params
      params.permit(:content,:group_id,:image)
    end

  def count_params
    params.permit(:count)
  end
end
