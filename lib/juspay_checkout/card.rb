module JuspayCheckout
	class Card < JuspayCheckout::ExpressCheckout
		class << self

			# DOC - https://www.juspay.in/docs/api/ec/?shell#get-order-status
			# curl https://api.juspay.in/orders/145678234 \
			# -u your_api_key:
			def get_saved(customer_id)
				JuspayCheckout::ExpressCheckout.request("/cards?customer_id=#{customer_id}", 'get')
			end

			# DOC - https://www.juspay.in/docs/api/ec/?ruby#create-order
			def get_info(cardbin)
				JuspayCheckout::ExpressCheckout.request("/cardbins/#{cardbin}?merchant_id=bewakoof&options.check_atm_pin_auth_support=true", 'get')
			end

			# DOC - https://www.juspay.in/docs/api/ec/?shell#refund-order
			def delete(token)
				JuspayCheckout::ExpressCheckout.request("/card/delete", 'post', {card_token: token})
			end
		end
	end
end