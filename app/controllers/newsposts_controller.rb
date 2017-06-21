class NewspostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user, only: :destroy

  def create
    @newspost = current_user.newsposts.build newspost_params

    if @newspost.save
      flash[:success] = t ".post_success"
      redirect_to root_url
    else
      flash.now[:danger] = t ".post_error"
      @feed_items = []
      render "static_pages/home"
    end
  end

  def destroy
    if @newspost.destroy
      flash[:success] = t ".delete_success"
      redirect_to request.referrer || root_url
    else
      flash.now[:danger] = t ".delete_error"
      render "static_pages/home"
    end
  end

  private

  def newspost_params
    params.require(:newspost).permit :content, :picture
  end

  def correct_user
    @newspost = current_user.newsposts.find_by id: params[:id]

    redirect_to root_url if @newspost.nil?
  end
end
