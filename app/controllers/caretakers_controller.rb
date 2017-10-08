module Api

	class CaretakersController < ApplicationController

		def create
			@caretaker = Caretaker.new((name: params[:name], phone: params[:phone], email: params[:email], address: params[:address], primary_caretaker: params[:primary_caretaker], account_id: params[:account_id]))
			
			if @user.save
        render json: {status: 'SUCCESS', message: 'Caretaker Added'}.to_json
      else
        render json: {errors: ["Caretaker not added!"], status: 422}.to_json
      end

		end

		def show
			@caretaker = Caretaker.all
		end

		def update
			if @caretaker.update((name: params[:name], phone: params[:phone], email: params[:email], address: params[:address], primary_caretaker: params[:primary_caretaker], account_id: params[:account_id]))
        render json: {status: 'SUCCESS', message: 'Caretaker Update'}.to_json
      else
        render json: {errors: ["Caretaker not updated!"], status: 422}.to_json
      end
		end

		def destroy
			if @caretaker.destroy((name: params[:name], phone: params[:phone], email: params[:email], address: params[:address], primary_caretaker: params[:primary_caretaker], account_id: params[:account_id]))
        render text: "Caretaker Removed"
      else
        render text: "Unable to remove Caretaker"
      end
		end

	end

end