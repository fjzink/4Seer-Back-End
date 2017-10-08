module Api

	class AccountsController < ApplicationController
		# API call to get users accounts info
		response = HTTParty.post('http://api119525live.gateway.akana.com:80/user/accounts', 
			:headers => {
				'AppId': 'usbinnovation-5WB5zSTo2Ri2D2unq9QXLb9d', 
				'SharedSecret': '5f6dac108fe0334831d940a7840c8f12e24ca9ce', 
				'Content-Type': 'application/json' }, 
				:body => {
					'LegalParticipantIdentifier' => '000996202016520455'
		}.to_json)

		data = JSON.parse(response.body)

		account_details = data["AccessibleAccountDetailList"]

		account_details.each do |details|
			@account_info = Account.create(
															lpid: details["LegalParticipantIdentifier"], 
															ocid: details["OperatingCompanyIdentifier"], 
															product_code: details["ProductCode"], 
															primary_id: details["PrimaryIdentifier"] 
															)
		 
		end

		# Set Data from API to database


		# API call to get user account transactions
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