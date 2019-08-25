class Registration < ApplicationRecord
	belongs_to :user

	def process_payments
		customer = Stripe::Customer.create(email: email, card: card_token)
		Stripe::Charge.create(customer: customer.id,
			                   amount: 10000*100,
			                   description: 'One Time Payment',
			                   currency: 'usd')
	end
end
