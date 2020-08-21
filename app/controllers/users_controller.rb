class UsersController < ApplicationController
	before_action :authenticate_user!

	def show
		@user = User.find(params[:id])
		@statuses = @user.statuses
		@status = Status.new
        @weights = @statuses.map(&:weight)
        @oneday = @user.statuses.where(created_at: Time.zone.now.all_day)
        @dates = @statuses.map{|status| status.created_at.strftime('%Y/%m/%d') }
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
	    params.require(:user).permit(:name)
	end

end
