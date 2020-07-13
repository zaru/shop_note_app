class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.build(comment_params)
    @comment.note_id = params[:note_id]

    if @comment.save

      flash[:success] = "入力完了しました"
      redirect_to request.referrer || root_url
    else
      redirect_to request.referrer || root_url
    end
  end

  # def update
  # end

  def destroy
    comment = Comment.find(params[:id]).destroy
    flash[:success] = "削除しました"
    redirect_to request.referrer || root_url
  end

  private
    def  comment_params
      params.permit(:content)
    end

end
