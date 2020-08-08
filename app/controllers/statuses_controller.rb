class StatusesController < ApplicationController

	def new
		
	end

	def show
		
	end

	def create
		
	end

	def edit
		
	end

	def update
		
	end

	def destroy
		
	end

	private
	def status_params
	    params.require(:status).permit(:weight)
	end

end
