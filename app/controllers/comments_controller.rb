class CommentsController < ApplicationController

  def create
    @newspost = Newspost.find(params[:newspost_id])
    @comment = @newspost.comments.create(content: params[:comment][:content], user: current_user)
    @user = User.find_by id: @newspost.user_id
    redirect_to root_url
  end

  def destroy
    @newspost = Newspost.find(params[:newspost_id])
    @comment = @newspost.comments.find(params[:id])
    @comment.destroy
    @user = User.find_by id: @newspost.user_id
    redirect_to root_url
  end

  private

  def comment_params
    params.require(:comment).permit :content
  end
end
