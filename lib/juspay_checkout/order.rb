module JuspayCheckout
	class Order < JuspayCheckout::ExpressCheckout
		class << self

			# DOC - https://www.juspay.in/docs/api/ec/?shell#get-order-status
			# curl https://api.juspay.in/orders/145678234 \
			# -u your_api_key:
			def get_status(order_id)
				JuspayCheckout::ExpressCheckout.request("/orders/#{order_id}", 'get')
			end

			# DOC - https://www.juspay.in/docs/api/ec/?ruby#create-order
			def create(params = {})
				JuspayCheckout::ExpressCheckout.request("/orders", 'post', params)
			end

			# DOC - https://www.juspay.in/docs/api/ec/?shell#refund-order
			def refund(order_id, params = {})
				JuspayCheckout::ExpressCheckout.request("/orders/#{order_id}/refunds", 'post', params)
			end
		end
	end
end