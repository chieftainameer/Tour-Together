class RegistrationsController < ApplicationController
	before_action :authenticate_user!

	def create
		@registration = Registration.new(registration_params)
		@registration.user_id = current_user.id
		@registration.process_payments
		if @registration.save
		current_user.update_attribute(:paid, true)
		redirect_to new_tour_path
		else
          flash[:error] = "Something Went Wrong"
          redirect_to new_tour_path
		end

	end

	private

	def registration_params
		params.require(:registration).permit(:full_name, :email, :telephone, :user_id).merge(email: stripe_params['stripeEmail'], card_token: stripe_params[:stripeToken])
	end

	def stripe_params
		params.permit(:stripeEmail, :stripeToken)
	end

end
