class StatusesController < ApplicationController

	def new
		@status = Status.new
	end

	def show
		
	end

	def create
		@status = Status.new(status_params)
	    @status.user_id = current_user.id
	    if @status.save
	        redirect_to @status
	    else
			render 'new'
        end
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
