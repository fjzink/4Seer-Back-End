Account.destroy_all
Transaction.destroy_all

response = HTTParty.post('http://api119525live.gateway.akana.com:80/user/accounts', 
  :headers => {
    'AppId': 'usbinnovation-5WB5zSTo2Ri2D2unq9QXLb9d', 
    'SharedSecret': '5f6dac108fe0334831d940a7840c8f12e24ca9ce', 
    'Content-Type': 'application/json' }, 
    :body => {
      'LegalParticipantIdentifier' => '913996201744144603'
}.to_json)

data = JSON.parse(response.body)

account_details = data["AccessibleAccountDetailList"]

account_details.each do |details|
  @account_info = Account.create(
                  lpid: details["LegalParticipantIdentifier"], 
                  ocid: details["OperatingCompanyIdentifier"], 
                  product_code: details["ProductCode"], 
                  primary_id: details["PrimaryIdentifier"],
                  current_balance: details["BasicAccountDetail"]["Balances"]["CurrentBalanceAmount"]
  )
end

Account.all.map do |a|
  response = HTTParty.post('https://api119622live.gateway.akana.com:443/account/transactions', 
    :headers => {
      'AppId': 'usbinnovation-5WB5zSTo2Ri2D2unq9QXLb9d', 
      'SharedSecret': '5f6dac108fe0334831d940a7840c8f12e24ca9ce', 
      'Content-Type': 'application/json' }, 
      :body => {
        "OperatingCompanyIdentifier": a.ocid,
        "ProductCode": a.product_code,
        "PrimaryIdentifier": a.primary_id
      }.to_json)
  
  data = JSON.parse(response.body)

  transaction_details = data["MonetaryTransactionResponseList"] 

  transaction_details.map do |t|
    Transaction.create(
      date_time: t["PostedDate"],
      posted_amount: t["PostedAmount"],
      description: t["TransactionDescription"],
      short_descript: t["ShortDescription"],
      account_id: a.id
      )
  end
end