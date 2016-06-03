class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :get_categories, if: :devise_controller?


    protected
    def get_categories
    	@categories = Category.all
    end

    def configure_permitted_parameters
        devise_parameter_sanitizer.for(:account_update) { |u| u.permit(
        	{category_ids: []}, :avatar , :current_password) }
    end
end
