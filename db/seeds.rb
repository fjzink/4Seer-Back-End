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