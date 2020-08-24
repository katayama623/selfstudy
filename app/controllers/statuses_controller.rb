class StatusesController < ApplicationController
	before_action :authenticate_user!

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
		@user = current_user
		@status = Status.new(status_params)
	    @status.user_id = current_user.id
	    if @status.save
	        redirect_to user_path(@user)
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
		@user = current_user
		@status = Status.find(params[:id])
		@status.destroy
		redirect_to user_path(@user)
	end

	private
	def status_params
	    params.require(:status).permit(:weight)
	end

	def screen_user(status)
        if status.user.id != current_user.id
            redirect_to root_path
        end
    end

end
