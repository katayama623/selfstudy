class UsersController < ApplicationController

	def show
		@user = User.find(params[:id])
		@statuses = @user.statuses.all
        @weights = @statuses.map(&:weight)
        @dates = @statuses.map{|status| status.created_at.strftime('%Y/%m/%d') }
	end

	def edit
	    @user = User.find(params[:id])
	end

	private
	def user_params
	    params.require(:user).permit(:name)
	end

end
