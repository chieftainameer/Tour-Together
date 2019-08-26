class HomeController < ApplicationController
  def index
  	@tours = Tour.order(created_at: :desc)
  	@feed_items = current_user.feed.order(created_at: :desc).paginate(page: params[:page], per_page: 10)
  	@post = Post.new
  end
end
