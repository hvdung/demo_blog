class PagesController < ApplicationController
  def home
    if logged_in?
      @post  = current_user.posts.build
      @posts = current_user.feed.paginate(page: params[:page], :per_page => 10)
    end

  end
end
