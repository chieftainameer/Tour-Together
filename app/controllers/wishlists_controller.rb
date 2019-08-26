class WishlistsController < ApplicationController
	before_action :authenticate_user!

	def index
		@wishlists = current_user.wishlisted_tours.order(created_at: :desc).paginate(page: params[:page], per_page: 10)
	end

	def create
		@tour = Tour.find(params[:tour_id])
		current_user.add_to_wishlist(@tour)

		redirect_to tours_path
	end

end
