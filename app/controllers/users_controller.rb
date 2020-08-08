class UsersController < ApplicationController

	def show
		@user = User.find(params[:id])
		@statuses = @user.statuses.all
	end

	def edit
	    @user = User.find(params[:id])
	end

	private
	def user_params
	    params.require(:user).permit(:name)
	end

end
