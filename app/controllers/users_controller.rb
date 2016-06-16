class UsersController < ApplicationController
	before_action :set_user, only: [:show]

	def show
		@ratings = @user.ratings
		@average = (Rating.where(user_id: params[:id]).sum(:score))/(Rating.where(user_id: params[:id]).count)
	end

	
	private

	def set_user
		@user = User.find(params[:id])
  	end
end
