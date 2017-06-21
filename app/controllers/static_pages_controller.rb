class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @newspost = current_user.newsposts.build
      @feed_items = current_user.feed.feed_sort.page(params[:page]).
        per_page Settings.newspost.number
    end
  end

  def about
  end

  def contact
  end
end
