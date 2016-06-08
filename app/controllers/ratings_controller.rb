class RatingsController < ApplicationController

	def new
		@rating = selected_user.ratings.build
	end

	def create
		@rating = selected_user.ratings.build(rating_params)

		if @rating.save
			redirect_to selected_user, notice: 'Rating was successfully created.'
		else
			render :new, notice: 'Algo anda mal'
		end
	end

private

	def selected_user
		@selected_user ||= User.find(params[:user_id])
	end
	# helper_method :selected_user -> si quiero usar este metodo en las vistas

	def rating_params
		params.require(:rating).permit(:score, :comment)
	end
end
