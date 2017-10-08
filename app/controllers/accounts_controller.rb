module Api

	class AccountsController < ApplicationController
		
		def show
			@account = Account.find(id: params[:id])
				
			if @account
				render json: @account.transactions.ordered_json
			else
				render :nothing => true, status: 404
			end
		end

	end

end
