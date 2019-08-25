class JoinedtoursController < ApplicationController
	before_action :authenticate_user!

	def create
		@tour = Tour.find(params[:tour_id])
		current_user.join(@tour)

		redirect_to @tour
	end
end
