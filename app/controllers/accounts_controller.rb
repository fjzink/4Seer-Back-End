module Api

	class AccountsController < ApplicationController
		# API call to get users accounts info


		# Set Data from API to database


		# API call to get user account transactions
		def show 
			response = HTTParty.post('https://api119622live.gateway.akana.com:443/account/transactions', 
				:headers => {
					'AppId': 'usbinnovation-5WB5zSTo2Ri2D2unq9QXLb9d', 
					'SharedSecret': '5f6dac108fe0334831d940a7840c8f12e24ca9ce', 
					'Content-Type': 'application/json' }, 
					:body => {
				    "OperatingCompanyIdentifier": @account_info.ocid,
				    "ProductCode": @account_info.product_code,
				    "PrimaryIdentifier": @account_info.primary_id
					}.to_json)
			data = JSON.parse(response.body)
		end
	end

end
