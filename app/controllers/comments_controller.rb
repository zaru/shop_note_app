class CommentsController < ApplicationController
  def create

    @user = User.find_by(params[:id])

    @comment = @user.comment.build(comment_params)
    if @comment.save
      flash[:success] = "入力完了しました"
      redirect_to root_url
    else
      render '/home/help'
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
      params.permit(:url,:content)
    end

end
