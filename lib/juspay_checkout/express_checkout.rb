module JuspayCheckout	
	class ExpressCheckout
		class << self
			def request(partial_url, http_method, params = {})
				begin
					# base url for juspay
					if ::Rails.env == 'production'
			      		base_url = 'https://api.juspay.in'
			    	else
			      		base_url = 'https://sandbox.juspay.in'
					end
					$juspay_config or credential_config
					# basic auth info
					auth = {username: $juspay_config['api_key'], password: ''}

					# header
					header = {'Accept': 'application/json'}	
		
					if http_method == 'get'
						response =  HTTParty.get(base_url+partial_url, basic_auth: auth, headers: header).to_hash rescue nil
					elsif http_method == 'post'
						response = HTTParty.post(base_url+partial_url, body: params, basic_auth: auth, headers: header).to_hash rescue nil
					end
					response
				rescue
					nil
				end
			end

			def credential_config
				$juspay_config = ::Rails.application.config_for(:juspay)
			end
		end
	end
end