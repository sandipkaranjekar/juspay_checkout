module JuspayCheckout
	class Customer < JuspayCheckout::ExpressCheckout
		class << self

			# DOC - https://www.juspay.in/docs/api/ec/?shell#get-customer
			# curl -X GET https://api.juspay.in/customers/customer@gmail.com
			# -u your_api_key:
			def get_details(customer_id)
				JuspayCheckout::ExpressCheckout.request("/customers/#{customer_id}", 'get')
			end

			# DOC - https://www.juspay.in/docs/api/ec/?shell#create-customer
			# Example request
			# curl -X POST https://api.juspay.in/customers
			# -u your_api_key:
			# -d "object_reference_id=customer@gmail.com"
			# -d "mobile_number=9000000001" 
			# -d "email_address=customer@gmail.com"
			# -d "first_name=Sandip"
			# -d "last_name=Patil"
			# -d "mobile_country_code=91"
			def create(params = {})
				JuspayCheckout::ExpressCheckout.request('/customers', 'post', params)
			end

			# DOC - https://www.juspay.in/docs/api/ec/?shell#update-customer
			# Example request
			# curl -X POST https://api.juspay.in/customers/cst_om2l6ctlptxwxuzj
			# -u your_api_key:
			# -d "mobile_number=9000000002"   
			# -d "email_address=customer@gmail.com"
			# -d "first_name=Sandip"
			# -d "last_name=Patil"
			# -d "mobile_country_code=91"
			def update(params = {})
				JuspayCheckout::ExpressCheckout.request("/customers/#{params['customer_id']}", 'post', params.except(:customer_id))
			end

		end
	end
end