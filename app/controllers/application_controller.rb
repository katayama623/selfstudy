class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

	protected

    def after_sign_in_path_for(resource)
		if user_signed_in?
		    user_path(resource)
		else
		    admin_root_path
		end
	end


    def after_sign_out_path_for(resource)
        root_path
    end

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :sex, :message, :height])
    end

end
