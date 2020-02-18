module JuspayCheckout
	class Wallet < JuspayCheckout::ExpressCheckout
		class << self

			# DOC - https://www.juspay.in/docs/api/ec/?shell#list
			# curl -X GET https://api.juspay.in/customers/guest_user/wallets
			# -u your_api_key:
			def get_list(customer_id)
				JuspayCheckout::ExpressCheckout.request("/customers/#{customer_id}/wallets", 'get')
			end

			# DOC - https://www.juspay.in/docs/api/ec/?shell#get
			# curl -X GET https://api.juspay.in/wallets/$wallet_id
			# -u your_api_key: 
			def get_details(wallet_id)
				JuspayCheckout::ExpressCheckout.request("/wallets/#{wallet_id}", 'get')
			end

			# DOC - https://www.juspay.in/docs/api/ec/?shell#create
			# curl -X POST https://api.juspay.in/customers/$customer_id/wallets
			# -u your_api_key:
			# -d "gateway=MOBIKWIK"
			# -d "command=authenticate"
			def create(customer_id, wallet)
				JuspayCheckout::ExpressCheckout.request("/customers/#{customer_id}/wallets", 'post', {command: "authenticate", gateway: wallet})
			end

			# DOC - https://www.juspay.in/docs/api/ec/?shell#link
			# curl -X POST https://api.juspay.in/wallets/$wallet_id
			# -u your_api_key:
			# -d "command=link"
			# -d "otp=345678"
			def link(wallet_id, otp)
				JuspayCheckout::ExpressCheckout.request("/wallets/#{wallet_id}", 'post', {command: 'link', otp: otp})
			end

			# DOC - https://www.juspay.in/docs/api/ec/?shell#delink
			# curl -X POST https://api.juspay.in/wallets/$wallet_id
			# -u your_api_key:
			# -d "command=delink"
			def delink(wallet_id)
				JuspayCheckout::ExpressCheckout.request("/wallets/#{wallet_id}", 'post', {command: 'delink'})
			end

			# DOC - https://www.juspay.in/docs/api/ec/?shell#authenticate
			# curl -X POST https://api.juspay.in/wallets/$wallet_id \
			# -u your_api_key: \
			# -d "command=authenticate"
			def authenticate(wallet_id)
				JuspayCheckout::ExpressCheckout.request("/wallets/#{wallet_id}", 'post', {command: "authenticate"})
			end

			# DOC - https://www.juspay.in/docs/api/ec/?shell#refresh
			# curl -X POST https://api.juspay.in/wallets/$wallet_id
			# -u your_api_key:
			# -d "command=refresh"
			def refresh(wallet_id)
				JuspayCheckout::ExpressCheckout.request("/wallets/#{wallet_id}", 'post', {command: 'refresh'})
			end
		end
	end
end