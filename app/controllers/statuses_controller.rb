class StatusesController < ApplicationController

	def new
		@status = Status.new
	end

	def index
		@statuses = Status.all.order('created_at ASC')
        @weights = @statuses.map(&:weight)
        @dates = @statuses.map{|status| status.created_at.strftime('%Y/%m/%d') }
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
		@status = Status.find(params[:id])
	end

	def update
		@user = current_user
		@status = Status.find(params[:id])
		@status.update(status_params)
		redirect_to user_path(@user)
	end

	def destroy
		
	end

	private
	def status_params
	    params.require(:status).permit(:weight)
	end

end
