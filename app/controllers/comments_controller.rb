class CommentsController < ApplicationController
  before_action :load_comment, only: [:create, :destroy]

  def create
    @comment = @newspost.comments.create(content: params[:comment][:content],
      user: current_user)
    redirect_to root_url
  end

  def destroy
    @comment = @newspost.comments.find(params[:id])
    @comment.destroy
    redirect_to root_url
  end

  private

  def comment_params
    params.require(:comment).permit :content
  end

  def load_comment
     @newspost = Newspost.find(params[:newspost_id])
  end
end
