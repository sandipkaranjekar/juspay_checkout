module JuspayCheckout
	class Payment < JuspayCheckout::ExpressCheckout
		class << self
			# Gives list of all the payment methods available for your account.
			# DOC - https://www.juspay.in/docs/api/ec/?shell#payment-methods
			# curl -X GET https://api.juspay.in/merchants/guest/paymentmethods
			def get_payment_method
				JuspayCheckout::ExpressCheckout.request('/merchants/bewakoof/paymentmethods', 'get')
			end

		end
	end
end