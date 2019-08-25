class WishlistsController < ApplicationController
	before_action :authenticate_user!

	def index
		@wishlists = current_user.wishlisted_tours.order(created_at: :desc)
	end

	def create
		@tour = Tour.find(params[:tour_id])
		current_user.add_to_wishlist(@tour)

		redirect_to tours_path
	end

end
