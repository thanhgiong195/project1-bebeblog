class CommentsController < ApplicationController
  before_action :load_comment, only: [:create, :destroy]

  def create
    @comment = @newspost.comments.build comment_params
    @comment.user_id = current_user.id
    @comment.save
    respond_to do |format|
      format.html{redirect_to request.referer}
      format.js
    end
  end

  def destroy
    @comment = @newspost.comments.find_by id: params[:id]

    @comment.destroy
    respond_to do |format|
      format.html{redirect_to request.referer}
      format.js
    end
  end

  private

  def comment_params
    params.require(:comment).permit :content
  end

  def load_comment
    @newspost = Newspost.find_by id: params[:newspost_id]
  end
end
