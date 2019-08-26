class UsersController < ApplicationController

	before_action :set_user, only:[:show, :edit, :following, :followers]

	def index
		@users = User.all
	end

	def show
		@posts = @user.posts.paginate(page: params[:page], per_page: 4)
	end

	def edit
		
	end

	def update
		
	end
	def following
		@following = @user.following
	end

	def followers
		@followers = @user.followers
	end

	private

	def set_user
		@user = User.find(params[:id])
	end

end