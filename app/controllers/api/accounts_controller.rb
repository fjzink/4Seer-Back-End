class API::AccountsController < ApplicationController
	def show
		@account = Account.find(params[:id])
		if @account
			render json: [@account, @account.newest_transactions].to_json
		else
			render :nothing => true, status: 404
		end
	end

end

