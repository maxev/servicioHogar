class SearchController < ApplicationController
  def create
  	palabra = "%#{params[:palabra]}%"

  	@resultsUser = User.where("email LIKE ?",palabra)
  	@resultsCategory = Category.where("name LIKE ?",palabra)
  	
  end
end
