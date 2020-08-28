class UsersController < ApplicationController
	before_action :authenticate_user!
	before_action :screen_user, only: [:show, :edit, :update]

	def show
		@user = User.find(params[:id])
		@statuses = @user.statuses
		@status = Status.find(params[:id])
        @weights = @statuses.map(&:weight)
        @onedays = @user.statuses.where(created_at: Time.zone.now.all_day)
        @dates = @statuses.map{|status| status.created_at.strftime('%Y/%m/%d') }
        @variation = Status.where("id < ?")
	end

	def edit
	    @user = User.find(params[:id])
	end

	def update
	  	@user = User.find(params[:id])
	    if @user.update(user_params)
	        redirect_to user_path(@user)
	    else
	        render 'edit'
	    end
	 end

	private
	def user_params
	    params.require(:user).permit(:name, :height, :sex, :message)
	end

	def screen_user
        unless params[:id].to_i == current_user.id
            redirect_to user_path(current_user)
        end
    end

end
