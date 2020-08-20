class ApplicationController < ActionController::Base


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

end
