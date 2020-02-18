module JuspayCheckout
	class Signature
		class << self
			# DOC - https://www.juspay.in/docs/advanced/ec/response/index.html
			# After the redirect, the authenticity should be verified using the signature in the response. 
			# The signature parameter in the return_url gives the HMAC signature computed using the algorithm specified by the signature_algorithm parameter. 
			def is_valid?(params, signature)
				if params.present?
					$juspay_config or JuspayCheckout::ExpressCheckout.credential_config
					params = params.with_indifferent_access
        			parameter = params.except("signature", "signature_algorithm", "format", "controller", "action")
        			encoded_list = []
        			parameter.keys.sort.each { |k| encoded_list << URI.encode(k) + "=" + URI.encode(params[k]) }
        			data = CGI.escape(encoded_list.join("&"))

        			hash_string = CGI.escape(Base64.encode64(OpenSSL::HMAC.digest(OpenSSL::Digest.new('sha256'), $juspay_config['response_key'], data)).strip())

        			return signature == hash_string
        		end
        		false
			end
		end
	end
end