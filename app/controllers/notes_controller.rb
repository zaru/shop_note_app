class NotesController < ApplicationController
  # MEMO: ログインを必須にしたいコントローラは、専用のコントローラを作って継承する方が分かりやすい
  before_action :authenticate_user!
  def create
    if params[:content].present? or params[:image].present?

      params[:content].split(/[[:blank:]]+/).each do |note|
        # MEMO: strong parameter を使った方が良い
        # MEMO: strong parameter を使っていないが、分解して直接値を渡しているため ForbiddenAttributesError が出ていない…
        # MEMO: エラーハンドリングのやり方が大雑把なので save できちんと分岐させる方が良い
        current_user.notes.create(content: note, group_id: params[:group_id], image: params[:image])
      end
      if params[:image].present? && params[:content] == ""
        current_user.notes.create(content: "", group_id: params[:group_id],image: params[:image])
      end
      # MEMO: ここの処理は謎
      url = Rails.application.routes.recognize_path(request.referrer)
      if url == {:controller=>"home", :action=>"tutorial_note"}
        flash[:success] = "投稿に成功しました！"
        redirect_to request.referrer || root_url
      else
        redirect_to request.referrer || root_url
      end
    else
      flash[:danger] = "投稿に失敗しました"
        redirect_to request.referrer || root_url
    end
  end

  def count
    # MEMO: 誰でも他のノートを更新できる脆弱性がある
    @count = Note.find(params[:note_id])
    @count.count = params[:count]
    if @count.save
      redirect_to request.referrer || root_url
    else
      flash[:danger] = "投稿に失敗しました"
      render 'home/index'

    end
  end

  def destroy
    # MEMO: 誰でも他のノートを削除できる脆弱性がある
    params[:note][:id].each do |note_id|
      # MEMO: delete だとコールバックが発生しないので destroy の方が良い
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
